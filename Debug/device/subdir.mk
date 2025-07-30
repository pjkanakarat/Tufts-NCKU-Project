################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../device/system_LPC51U68.c 

C_DEPS += \
./device/system_LPC51U68.d 

OBJS += \
./device/system_LPC51U68.o 


# Each subdirectory must supply rules for building sources it contributes
device/%.o: ../device/%.c device/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_LPC51U68JBD64 -DCPU_LPC51U68JBD64_cm0plus -DMCUXPRESSO_SDK -DCORE_M0PLUS -DSDK_DEBUGCONSOLE=1 -DMCUX_META_BUILD -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\alexsCode\source" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\alexsCode\drivers" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\alexsCode\CMSIS" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\alexsCode\CMSIS\m-profile" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\alexsCode\device" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\alexsCode\device\periph" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\alexsCode\utilities" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\alexsCode\utilities\str" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\alexsCode\utilities\debug_console_lite" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\alexsCode\component\uart" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\alexsCode\board" -O0 -fno-common -g3 -gdwarf-4 -c -ffunction-sections -fdata-sections -fno-builtin -imacros "C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\alexsCode\source\mcux_config.h" -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m0plus -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-device

clean-device:
	-$(RM) ./device/system_LPC51U68.d ./device/system_LPC51U68.o

.PHONY: clean-device

