################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/fsl_clock.c \
../drivers/fsl_common.c \
../drivers/fsl_common_arm.c \
../drivers/fsl_flexcomm.c \
../drivers/fsl_gpio.c \
../drivers/fsl_i2c.c \
../drivers/fsl_inputmux.c \
../drivers/fsl_power.c \
../drivers/fsl_reset.c \
../drivers/fsl_usart.c 

C_DEPS += \
./drivers/fsl_clock.d \
./drivers/fsl_common.d \
./drivers/fsl_common_arm.d \
./drivers/fsl_flexcomm.d \
./drivers/fsl_gpio.d \
./drivers/fsl_i2c.d \
./drivers/fsl_inputmux.d \
./drivers/fsl_power.d \
./drivers/fsl_reset.d \
./drivers/fsl_usart.d 

OBJS += \
./drivers/fsl_clock.o \
./drivers/fsl_common.o \
./drivers/fsl_common_arm.o \
./drivers/fsl_flexcomm.o \
./drivers/fsl_gpio.o \
./drivers/fsl_i2c.o \
./drivers/fsl_inputmux.o \
./drivers/fsl_power.o \
./drivers/fsl_reset.o \
./drivers/fsl_usart.o 


# Each subdirectory must supply rules for building sources it contributes
drivers/%.o: ../drivers/%.c drivers/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DMCUXPRESSO_SDK -DCPU_LPC51U68JBD64 -DCORE_M0PLUS -DFSL_SDK_ENABLE_I2C_DRIVER_TRANSACTIONAL_APIS=0 -DSDK_DEBUGCONSOLE=1 -DMCUX_META_BUILD -DCPU_LPC51U68JBD64_cm0plus -DCR_INTEGER_PRINTF -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\lpcxpresso51u68_lpc_i2c_polling_b2b_master\source" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\lpcxpresso51u68_lpc_i2c_polling_b2b_master\drivers" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\lpcxpresso51u68_lpc_i2c_polling_b2b_master\CMSIS" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\lpcxpresso51u68_lpc_i2c_polling_b2b_master\CMSIS\m-profile" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\lpcxpresso51u68_lpc_i2c_polling_b2b_master\device" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\lpcxpresso51u68_lpc_i2c_polling_b2b_master\device\periph" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\lpcxpresso51u68_lpc_i2c_polling_b2b_master\utilities" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\lpcxpresso51u68_lpc_i2c_polling_b2b_master\utilities\str" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\lpcxpresso51u68_lpc_i2c_polling_b2b_master\utilities\debug_console_lite" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\lpcxpresso51u68_lpc_i2c_polling_b2b_master\component\uart" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\lpcxpresso51u68_lpc_i2c_polling_b2b_master\board" -O0 -fno-common -g3 -gdwarf-4 -c -ffunction-sections -fdata-sections -fno-builtin -imacros "C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\lpcxpresso51u68_lpc_i2c_polling_b2b_master\source\mcux_config.h" -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m0plus -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-drivers

clean-drivers:
	-$(RM) ./drivers/fsl_clock.d ./drivers/fsl_clock.o ./drivers/fsl_common.d ./drivers/fsl_common.o ./drivers/fsl_common_arm.d ./drivers/fsl_common_arm.o ./drivers/fsl_flexcomm.d ./drivers/fsl_flexcomm.o ./drivers/fsl_gpio.d ./drivers/fsl_gpio.o ./drivers/fsl_i2c.d ./drivers/fsl_i2c.o ./drivers/fsl_inputmux.d ./drivers/fsl_inputmux.o ./drivers/fsl_power.d ./drivers/fsl_power.o ./drivers/fsl_reset.d ./drivers/fsl_reset.o ./drivers/fsl_usart.d ./drivers/fsl_usart.o

.PHONY: clean-drivers

