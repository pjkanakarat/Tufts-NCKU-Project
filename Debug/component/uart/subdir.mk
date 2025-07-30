################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../component/uart/fsl_adapter_usart.c 

C_DEPS += \
./component/uart/fsl_adapter_usart.d 

OBJS += \
./component/uart/fsl_adapter_usart.o 


# Each subdirectory must supply rules for building sources it contributes
component/uart/%.o: ../component/uart/%.c component/uart/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DMCUXPRESSO_SDK -DCPU_LPC51U68JBD64 -DCORE_M0PLUS -DFSL_SDK_ENABLE_I2C_DRIVER_TRANSACTIONAL_APIS=0 -DSDK_DEBUGCONSOLE=1 -DMCUX_META_BUILD -DCPU_LPC51U68JBD64_cm0plus -DCR_INTEGER_PRINTF -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\lpcxpresso51u68_lpc_i2c_polling_b2b_master\source" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\lpcxpresso51u68_lpc_i2c_polling_b2b_master\drivers" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\lpcxpresso51u68_lpc_i2c_polling_b2b_master\CMSIS" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\lpcxpresso51u68_lpc_i2c_polling_b2b_master\CMSIS\m-profile" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\lpcxpresso51u68_lpc_i2c_polling_b2b_master\device" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\lpcxpresso51u68_lpc_i2c_polling_b2b_master\device\periph" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\lpcxpresso51u68_lpc_i2c_polling_b2b_master\utilities" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\lpcxpresso51u68_lpc_i2c_polling_b2b_master\utilities\str" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\lpcxpresso51u68_lpc_i2c_polling_b2b_master\utilities\debug_console_lite" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\lpcxpresso51u68_lpc_i2c_polling_b2b_master\component\uart" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\lpcxpresso51u68_lpc_i2c_polling_b2b_master\board" -O0 -fno-common -g3 -gdwarf-4 -c -ffunction-sections -fdata-sections -fno-builtin -imacros "C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\lpcxpresso51u68_lpc_i2c_polling_b2b_master\source\mcux_config.h" -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m0plus -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-component-2f-uart

clean-component-2f-uart:
	-$(RM) ./component/uart/fsl_adapter_usart.d ./component/uart/fsl_adapter_usart.o

.PHONY: clean-component-2f-uart

