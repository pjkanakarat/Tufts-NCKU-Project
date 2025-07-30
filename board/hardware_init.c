/*
 * Copyright (c) 2016, Freescale Semiconductor, Inc.
 * Copyright 2016-2017 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */
/*${header:start}*/
#include "pin_mux.h"
#include "board.h"
#include <stdbool.h>
/*${header:end}*/

/*${function:start}*/
void BOARD_InitHardware(void)
{
    /* attach 12 MHz clock to FLEXCOMM0 (debug console) */
    CLOCK_AttachClk(BOARD_DEBUG_UART_CLK_ATTACH);

    /* attach 12 MHz clock to SPI5 (FLEXCOMM5) */
    CLOCK_AttachClk(kFRO12M_to_FLEXCOMM5);
    CLOCK_AttachClk(kFRO12M_to_FLEXCOMM4);

    /* reset FLEXCOMM for SPI */
    RESET_PeripheralReset(kFC5_RST_SHIFT_RSTn);
    RESET_PeripheralReset(kFC4_RST_SHIFT_RSTn);

    BOARD_InitBootPins();
    BOARD_InitBootClocks();
    BOARD_InitDebugConsole();

    //Patrick
	BOARD_InitSecureMCUPins(); //Configures 0/25 and 0/26 to be Flexcomm 4

	gpio_pin_config_t gpio_config = {
	    .pinDirection = kGPIO_DigitalOutput,
	    .outputLogic = 1U
	};
	GPIO_PinInit(GPIO, 1U, 16U, &gpio_config);
}
/*${function:end}*/
