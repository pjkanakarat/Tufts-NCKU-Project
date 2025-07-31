/*
 * i2c_func.c
 *
 *  Created on: 2025年7月22日
 *      Author: eestaff
 */

#include "i2c_func.h"
#include "Si5351A-RevB-Registers3.h"


//ADC slave address = 0x68 + 0b1 for write
//last bit is read/write

i2c_master_config_t masterConfig;
status_t reVal        = kStatus_Fail;
uint8_t initial_reg_info[initial_reg_num][2] = {{0x03, 0xFF}, {0x09, 0xFF}, {0x16, 0x80}, {0x17, 0x80},
												{0x18, 0x80}, {0x19, 0x80}, {0x20, 0x80}, {0x21, 0x80},
												{0x22, 0x80}, {0x23, 0x80}, {0xb1, 0xac}, {0x03, 0x00}};

uint8_t adc_addr = 0x68;
uint8_t adc_tx = 0b10001100 | CHANNEL_1; //RDY = 1, Channel = 00 (Placeholder), Conversation = 0, Sample Rate = 11, PGA = 00
uint8_t dac_rx[4];
uint8_t temp_rx[4];
uint8_t config_dac_rx;
uint8_t config_temp_rx;
uint8_t config_rx;

int i2c_write(uint8_t initial_reg_info[][2], status_t *status, uint32_t i_start, uint32_t i_end) {
    /* Send initial register config */
    for (uint32_t i = i_start; i < i_end; i++) {
    	PRINTF("Sending data to Reg 0x%x...", initial_reg_info[i][0]);
		if (kStatus_Success == I2C_MasterStart(EXAMPLE_I2C_MASTER, I2C_MASTER_SLAVE_ADDR_7BIT, kI2C_Write))
		{
			*status = I2C_MasterWriteBlocking(EXAMPLE_I2C_MASTER, &initial_reg_info[i][0], 1, kI2C_TransferNoStopFlag);
			if (*status != kStatus_Success)
			{
				PRINTF("Address write failed 0x%x - ", *status);
				return -1;
			}
			*status = I2C_MasterWriteBlocking(EXAMPLE_I2C_MASTER, &initial_reg_info[i][1], 1, kI2C_TransferDefaultFlag);
			if (*status != kStatus_Success)
			{
				PRINTF("Data write failed 0x%x - ", *status);
				return -1;
			}

		}
		else {
			return -1;
		}
		PRINTF("Success\r\n");
    }
    PRINTF("\r\n");
    return 0;
}

int i2c_write_main(status_t *status) {
    for (uint32_t i = 0U; i < SI5351A_REVB_REG_CONFIG_NUM_REGS; i++) {
    	PRINTF("Sending data to Reg 0x%x...", si5351a_revb_registers[i].address);
		if (kStatus_Success == I2C_MasterStart(EXAMPLE_I2C_MASTER, I2C_MASTER_SLAVE_ADDR_7BIT, kI2C_Write))
		{
			*status = I2C_MasterWriteBlocking(EXAMPLE_I2C_MASTER, &si5351a_revb_registers[i].address, 1, kI2C_TransferNoStopFlag);
			if (*status != kStatus_Success)
			{
				PRINTF("Address write failed 0x%x - ", *status);
				return -1;
			}
			*status = I2C_MasterWriteBlocking(EXAMPLE_I2C_MASTER, &si5351a_revb_registers[i].value, 1, kI2C_TransferDefaultFlag);
			if (*status != kStatus_Success)
			{
				PRINTF("Data write failed 0x%x - ", *status);
				return -1;
			}

		}
		else {
			return -1;
		}
		PRINTF("Success\r\n");
    }
    PRINTF("\r\n");
    return 0;
}

int i2c_adc_config(uint8_t channel, status_t *status) {
	//PRINTF("Sending data to ADC Reg 0x%x...", adc_addr);
	if (kStatus_Success == I2C_MasterStart(EXAMPLE_I2C_MASTER, adc_addr, kI2C_Write))
	{
		adc_tx &= ~(0b11 << 5);
		adc_tx |= channel;
		*status = I2C_MasterWriteBlocking(EXAMPLE_I2C_MASTER, &adc_tx, 1, kI2C_TransferDefaultFlag);
		if (*status != kStatus_Success)
		{
			PRINTF("Data write failed 0x%x - ", *status);
			return -1;
		}
	}
	else {
		PRINTF("Failed to start ADC I2C Connection\n");
		return -1;
	}
	//PRINTF("Success\r\n\r\n");

	return 0;
}

int i2c_adc_read(uint8_t * buf, int buf_size, status_t *status) {
	if (kStatus_Success == I2C_MasterStart(EXAMPLE_I2C_MASTER, adc_addr, kI2C_Read)) {
		*status = I2C_MasterReadBlocking(EXAMPLE_I2C_MASTER, buf, buf_size, kI2C_TransferDefaultFlag);
		if (*status != kStatus_Success)
		{
			PRINTF("Data read failed 0x%x - ", *status);
			return -1;
		}
	}
	else {
		return -1;
	}
}

void convert_adc(uint8_t * buf, int * volts_upper, int * microvolts) {
    // Mask out lowest 2 bits of buf[0] because they're not data bits
    int32_t raw_adc = ((int32_t)(buf[0] & 0x3F) << 16) | ((int32_t)buf[1] << 8) | buf[2];  // 0b00000000 MMMMMMXX XXXXXXXX XXXXXXXX

    // Sign extend if negative (bit 17)
    if (raw_adc & 0x20000) {  // 1 << 17
        raw_adc |= 0xFFFC0000; // Set upper bits to 1s
    }

    double voltage = (double)raw_adc * 15.625e-6;

    *volts_upper = (int)voltage;
    *microvolts = (int)((voltage - *volts_upper) * 1000000);

}

void read_dac() {
	if (i2c_adc_config(CHANNEL_3, &reVal) == -1) {
		PRINTF("Error during ADC transmission");
	}

	do {
		if (i2c_adc_read(dac_rx, 4, &reVal) == -1) {
			PRINTF("Error reading from ADC");
		}
		SDK_DelayAtLeastUs(10000, CLOCK_GetFreq(kCLOCK_CoreSysClk));
	} while (dac_rx[3] & 0x80);

	PRINTF("ADC Data: 0b%b %b %b Configuration: 0b%b\r\n", dac_rx[0], dac_rx[1], dac_rx[2], dac_rx[3]);
	int volts_upper;
	int microvolts;
	convert_adc(dac_rx, &volts_upper, &microvolts);
	PRINTF("Voltage: %d.%06d V\n", volts_upper, microvolts);
}

void read_temp() {
	if (i2c_adc_config(CHANNEL_2, &reVal) == -1) {
		PRINTF("Error during ADC transmission");
	}

    do {
    	if (i2c_adc_read(temp_rx, 4, &reVal) == -1) {
    		PRINTF("Error reading from ADC");
    	}
        SDK_DelayAtLeastUs(10000, CLOCK_GetFreq(kCLOCK_CoreSysClk));
    } while (temp_rx[3] & 0x80);  // Ready bit set?


	PRINTF("ADC Data: 0b%b %b %b Configuration: 0b%b\r\n", temp_rx[0], temp_rx[1], temp_rx[2], temp_rx[3]);
	int volts_upper;
	int microvolts;
	convert_adc(temp_rx, &volts_upper, &microvolts);
	int millivolts = volts_upper * 1000 + microvolts / 1000;
	float temp = (millivolts - 500) / 10.0f;

	int temp_upper = (int) temp;
	int temp_lower = (int)((temp - temp_upper) * 10 + 0.5f);  // rounding to nearest digit

	// Fix for negative temperatures
	if (temp_lower < 0) {
		temp_lower = -temp_lower;
	}
		PRINTF("Temp: %d.%01d C\n", temp_upper, temp_lower);

}
void i2c_run() {
	I2C_MasterGetDefaultConfig(&masterConfig);
	/* Change the default baudrate configuration */
	masterConfig.baudRate_Bps = I2C_BAUDRATE;

	GPIO_PinWrite(GPIO, 1, 16, 1);

	/* Initialize the I2C master peripheral */
	I2C_MasterInit(EXAMPLE_I2C_MASTER, &masterConfig, I2C_MASTER_CLOCK_FREQUENCY);

	/* Send initial register config */
	if (i2c_write(initial_reg_info, &reVal, 0, initial_reg_num-2) == -1) {
		PRINTF("Error during initial transmission\n");
	}

	/* Send master blocking data to slave */
	if (i2c_write_main(&reVal) == -1) {
		PRINTF("Error during main transmission\n");
	}

	/* Send final register config */
	if (i2c_write(initial_reg_info, &reVal, initial_reg_num-2, initial_reg_num) == -1) {
		PRINTF("Error during final transmission\n");
	}

	while (1) {
		read_temp();

		SDK_DelayAtLeastUs(1000000, CLOCK_GetFreq(kCLOCK_CoreSysClk));

//		i2c_adc_read(&config_rx, 1, &reVal);
//		while ((config_rx & (1<<7)) == 1) {
//			i2c_adc_read(&config_rx, 1, &reVal);
//			SDK_DelayAtLeastUs(10000, CLOCK_GetFreq(kCLOCK_CoreSysClk));
//		}

		read_dac();

		SDK_DelayAtLeastUs(1000000, CLOCK_GetFreq(kCLOCK_CoreSysClk));
//		i2c_adc_read(&config_rx, 1, &reVal);
//		while ((config_rx & (1<<7)) == 1) {
//			i2c_adc_read(&config_rx, 1, &reVal);
//			SDK_DelayAtLeastUs(10000, CLOCK_GetFreq(kCLOCK_CoreSysClk));
//		}

	}

}
