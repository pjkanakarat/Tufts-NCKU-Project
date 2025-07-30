################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../source/MCP4822_FINAL_MAIN.c \
../source/mcp4822.c \
../source/semihost_hardfault.c 

C_DEPS += \
./source/MCP4822_FINAL_MAIN.d \
./source/mcp4822.d \
./source/semihost_hardfault.d 

OBJS += \
./source/MCP4822_FINAL_MAIN.o \
./source/mcp4822.o \
./source/semihost_hardfault.o 


# Each subdirectory must supply rules for building sources it contributes
source/%.o: ../source/%.c source/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_LPC51U68JBD64 -DCPU_LPC51U68JBD64_cm0plus -DMCUXPRESSO_SDK -DCORE_M0PLUS -DSDK_DEBUGCONSOLE=1 -DMCUX_META_BUILD -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\nckuee\Documents\MCUXpressoIDE_24.12.148\workspace\MCP4822_FINAL\source" -I"C:\Users\nckuee\Documents\MCUXpressoIDE_24.12.148\workspace\MCP4822_FINAL\drivers" -I"C:\Users\nckuee\Documents\MCUXpressoIDE_24.12.148\workspace\MCP4822_FINAL\CMSIS" -I"C:\Users\nckuee\Documents\MCUXpressoIDE_24.12.148\workspace\MCP4822_FINAL\CMSIS\m-profile" -I"C:\Users\nckuee\Documents\MCUXpressoIDE_24.12.148\workspace\MCP4822_FINAL\device" -I"C:\Users\nckuee\Documents\MCUXpressoIDE_24.12.148\workspace\MCP4822_FINAL\device\periph" -I"C:\Users\nckuee\Documents\MCUXpressoIDE_24.12.148\workspace\MCP4822_FINAL\utilities" -I"C:\Users\nckuee\Documents\MCUXpressoIDE_24.12.148\workspace\MCP4822_FINAL\utilities\str" -I"C:\Users\nckuee\Documents\MCUXpressoIDE_24.12.148\workspace\MCP4822_FINAL\utilities\debug_console_lite" -I"C:\Users\nckuee\Documents\MCUXpressoIDE_24.12.148\workspace\MCP4822_FINAL\component\uart" -I"C:\Users\nckuee\Documents\MCUXpressoIDE_24.12.148\workspace\MCP4822_FINAL\board" -O0 -fno-common -g3 -gdwarf-4 -c -ffunction-sections -fdata-sections -fno-builtin -imacros "C:\Users\nckuee\Documents\MCUXpressoIDE_24.12.148\workspace\MCP4822_FINAL\source\mcux_config.h" -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m0plus -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-source

clean-source:
	-$(RM) ./source/MCP4822_FINAL_MAIN.d ./source/MCP4822_FINAL_MAIN.o ./source/mcp4822.d ./source/mcp4822.o ./source/semihost_hardfault.d ./source/semihost_hardfault.o

.PHONY: clean-source

