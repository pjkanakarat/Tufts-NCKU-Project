/*
 * Copyright (c) 2016, Freescale Semiconductor, Inc.
 * Copyright 2016-2017 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */
#ifndef _APP_H_
#define _APP_H_

/*******************************************************************************
 * Definitions
 ******************************************************************************/
/*${macro:start}*/
#define EXAMPLE_SPI_MASTER          SPI3
#define EXAMPLE_SPI_MASTER_IRQ      FLEXCOMM3_IRQn
#define EXAMPLE_SPI_MASTER_CLK_SRC  kCLOCK_Flexcomm3
#define EXAMPLE_SPI_MASTER_CLK_FREQ CLOCK_GetFlexCommClkFreq(3)
#define EXAMPLE_SPI_SSEL            2
#define EXAMPLE_SPI_SPOL            kSPI_SpolActiveAllLow

#define APP_BOARD_TEST_LED_PORT 1U
#define APP_BOARD_TEST_LED_PIN  10U
#define APP_SW1_PORT             BOARD_SW1_GPIO_PORT
#define APP_SW1_PIN              BOARD_SW1_GPIO_PIN
#define APP_SW2_PORT			 BOARD_SW2_GPIO_PORT
#define APP_SW2_PIN				 BOARD_SW2_GPIO_PIN
/*${macro:end}*/

/*******************************************************************************
 * Prototypes
 ******************************************************************************/
/*${prototype:start}*/
void BOARD_InitHardware(void);
/*${prototype:end}*/

#endif /* _APP_H_ */
