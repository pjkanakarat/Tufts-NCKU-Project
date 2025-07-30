################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../startup/startup_lpc51u68.c 

C_DEPS += \
./startup/startup_lpc51u68.d 

OBJS += \
./startup/startup_lpc51u68.o 


# Each subdirectory must supply rules for building sources it contributes
startup/%.o: ../startup/%.c startup/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_LPC51U68JBD64 -DCPU_LPC51U68JBD64_cm0plus -DMCUXPRESSO_SDK -DCORE_M0PLUS -DSDK_DEBUGCONSOLE=1 -DMCUX_META_BUILD -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\nckuee\Documents\MCUXpressoIDE_24.12.148\workspace\MCP4822_FINAL\source" -I"C:\Users\nckuee\Documents\MCUXpressoIDE_24.12.148\workspace\MCP4822_FINAL\drivers" -I"C:\Users\nckuee\Documents\MCUXpressoIDE_24.12.148\workspace\MCP4822_FINAL\CMSIS" -I"C:\Users\nckuee\Documents\MCUXpressoIDE_24.12.148\workspace\MCP4822_FINAL\CMSIS\m-profile" -I"C:\Users\nckuee\Documents\MCUXpressoIDE_24.12.148\workspace\MCP4822_FINAL\device" -I"C:\Users\nckuee\Documents\MCUXpressoIDE_24.12.148\workspace\MCP4822_FINAL\device\periph" -I"C:\Users\nckuee\Documents\MCUXpressoIDE_24.12.148\workspace\MCP4822_FINAL\utilities" -I"C:\Users\nckuee\Documents\MCUXpressoIDE_24.12.148\workspace\MCP4822_FINAL\utilities\str" -I"C:\Users\nckuee\Documents\MCUXpressoIDE_24.12.148\workspace\MCP4822_FINAL\utilities\debug_console_lite" -I"C:\Users\nckuee\Documents\MCUXpressoIDE_24.12.148\workspace\MCP4822_FINAL\component\uart" -I"C:\Users\nckuee\Documents\MCUXpressoIDE_24.12.148\workspace\MCP4822_FINAL\board" -O0 -fno-common -g3 -gdwarf-4 -c -ffunction-sections -fdata-sections -fno-builtin -imacros "C:\Users\nckuee\Documents\MCUXpressoIDE_24.12.148\workspace\MCP4822_FINAL\source\mcux_config.h" -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m0plus -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-startup

clean-startup:
	-$(RM) ./startup/startup_lpc51u68.d ./startup/startup_lpc51u68.o

.PHONY: clean-startup

