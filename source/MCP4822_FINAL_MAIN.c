/*
 * Copyright (c) 2016, Freescale Semiconductor, Inc.
 * Copyright 2016-2017 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include "fsl_spi.h"
#include "board.h"
#include "app.h"
#include "fsl_debug_console.h"
#include "mcp4822.h"
#include "i2c_func.h"

/*******************************************************************************
 * Definitions
 ******************************************************************************/
#define SPI_MASTER          SPI5
#define SPI_MASTER_CLK_FREQ 12000000U

int main(void)
{
    BOARD_InitHardware();
    FLEXCOMM_Init(SPI_MASTER, FLEXCOMM_PERIPH_SPI);

    mcp4822_handle_t dac;
    MCP4822_Init(&dac, SPI_MASTER, SPI_MASTER_CLK_FREQ, 400000);

    uint16_t cmdA = MCP4822_BuildCommand(1900, 0, 0, 1); // VoutA (ADC)
    uint16_t cmdB = MCP4822_BuildCommand(2300, 1, 0, 1); // VoutB (Temp Sensor)

    PRINTF("\r\nStart of DAC Write\r\n");
    MCP4822_Write(&dac, cmdA);
    MCP4822_Write(&dac, cmdB);

    FLEXCOMM_Init(EXAMPLE_I2C_MASTER, FLEXCOMM_PERIPH_I2C);

    PRINTF("\r\nI2C board2board polling -- Master transfer.\r\n\n");

    i2c_run();

    PRINTF("\r\nEnd of I2C transfer.");

    while (1) {
    }
}
