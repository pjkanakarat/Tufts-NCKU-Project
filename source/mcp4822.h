#ifndef MCP4822_H
#define MCP4822_H

#include <stdint.h>
#include "fsl_spi.h"

// Structure to hold the SPI handle and configuration for the DAC
typedef struct {
    SPI_Type *spi_base;
    uint32_t spi_clk_freq;
    spi_master_config_t spi_config;
} mcp4822_handle_t;

void MCP4822_Init(mcp4822_handle_t *handle, SPI_Type *base, uint32_t clk_freq, uint32_t baud_rate);
uint16_t MCP4822_BuildCommand(uint16_t data, uint8_t channel, uint8_t gain, uint8_t active);
void MCP4822_Write(mcp4822_handle_t *handle, uint16_t command);

#endif // MCP4822_H
