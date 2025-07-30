#include "mcp4822.h"
#include "fsl_debug_console.h"

void MCP4822_Init(mcp4822_handle_t *handle, SPI_Type *base, uint32_t clk_freq, uint32_t baud_rate)
{
    handle->spi_base = base;
    handle->spi_clk_freq = clk_freq;

    SPI_MasterGetDefaultConfig(&handle->spi_config);
    handle->spi_config.baudRate_Bps = baud_rate;
    handle->spi_config.dataWidth = kSPI_Data16Bits;
    handle->spi_config.sselNum = kSPI_Ssel2;
    handle->spi_config.sselPol = kSPI_SpolActiveAllLow;

    SPI_MasterInit(base, &handle->spi_config, clk_freq);
}

uint16_t MCP4822_BuildCommand(uint16_t data, uint8_t channel, uint8_t gain, uint8_t active)
{
    uint16_t command = 0;

    // Channel bit (bit 15)
    if (channel == 1) {
        command |= 0x8000;  // DAC B
    } else {
        command |= 0x0000;  // DAC A
    }
    // Gain bit (bit 13)
    if (gain == 1) {
        command |= 0x2000;  // 1x gain
    } else {
        command |= 0x0000;  // 2x gain
    }
    // Active/shutdown bit (bit 12)
    if (active == 1) {
        command |= 0x1000;  // active mode
    } else {
        command |= 0x0000;  // shutdown mode
    }
    // Set bits 14 and 11 as per datasheet:
    // Bit 14 = 1 (buffered), Bit 11 = 0 (don't care here, usually 0)
    command |= 0x4000; // bit 14 set
    // Lower 12 bits: DAC data (D11..D0)
    command |= (data & 0x0FFF);
    return command;
}

void MCP4822_Write(mcp4822_handle_t *handle, uint16_t command)
{
    PRINTF("SPI Command: 0x%04X\n\r", command);

    uint8_t *txBuf = (uint8_t *)&command;

    spi_transfer_t xfer = {
        .txData = txBuf,
        .rxData = NULL,
        .dataSize = 2,
        .configFlags = kSPI_FrameAssert
    };

    SPI_MasterTransferBlocking(handle->spi_base, &xfer);
}
