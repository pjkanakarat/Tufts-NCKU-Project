/*
 * i2c_func.h
 *
 *  Created on: 2025年7月22日
 *      Author: eestaff
 */

#ifndef I2C_FUNC_H_
#define I2C_FUNC_H_


#include <stdio.h>
#include <string.h>
#include "board.h"
#include "fsl_debug_console.h"
#include "fsl_i2c.h"
#include "app.h"
#include "fsl_flexcomm.h"

#define EXAMPLE_I2C_MASTER_BASE    (I2C4_BASE)
#define I2C_MASTER_CLOCK_FREQUENCY (12000000)

#define EXAMPLE_I2C_MASTER ((I2C_Type *)EXAMPLE_I2C_MASTER_BASE)

#define I2C_MASTER_SLAVE_ADDR_7BIT 0x60U
#define I2C_BAUDRATE               100000U
#define initial_reg_num				12U
#define CHANNEL_1					0b00000000 //v3v3
#define CHANNEL_2					0b00100000 //Temp
#define CHANNEL_3					0b01000000 //DAC

int i2c_write(uint8_t initial_reg_info[][2], status_t *status, uint32_t i_start, uint32_t i_end);
int i2c_write_main(status_t *status);
void i2c_run();
int i2c_adc_config(uint8_t channel, status_t *status);
void convert_adc(uint8_t * buf, int * volts_upper, int * microvolts);
void read_dac();
void read_temp();

#endif /* I2C_FUNC_H_ */
