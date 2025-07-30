/*
 * Copyright (c) 2016, Freescale Semiconductor, Inc.
 * Copyright 2016-2019 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

/*  Standard C Included Files */
#include "i2c_func.h"

/*******************************************************************************
 * Definitions
 ******************************************************************************/

/*******************************************************************************
 * Prototypes
 ******************************************************************************/

/*******************************************************************************
 * Code

 ******************************************************************************/

/*!
 * @brief Main function
 */
int main(void)
{

    BOARD_InitHardware();
    FLEXCOMM_Init(EXAMPLE_I2C_MASTER, FLEXCOMM_PERIPH_I2C);
    PRINTF("\r\nI2C board2board polling -- Master transfer.\r\n\n");


    i2c_run();

    /* Wait until the slave is ready for transmit, wait time depend on user's case.
       Slave devices that need some time to process received byte or are not ready yet to
       send the next byte, can pull the clock low to signal to the master that it should wait.*/
    for (uint32_t i = 0U; i < WAIT_TIME; i++)
    {
        __NOP();
    }

    PRINTF("\r\nEnd of I2C transfer.\r\n");
    while (1){}
}
