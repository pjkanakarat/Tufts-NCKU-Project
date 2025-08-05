################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../utilities/str/fsl_str.c 

C_DEPS += \
./utilities/str/fsl_str.d 

OBJS += \
./utilities/str/fsl_str.o 


# Each subdirectory must supply rules for building sources it contributes
utilities/str/%.o: ../utilities/str/%.c utilities/str/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_LPC51U68JBD64 -DCPU_LPC51U68JBD64_cm0plus -DMCUXPRESSO_SDK -DCORE_M0PLUS -DSDK_DEBUGCONSOLE=1 -DMCUX_META_BUILD -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\mcuFinalCode\source" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\mcuFinalCode\drivers" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\mcuFinalCode\CMSIS" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\mcuFinalCode\CMSIS\m-profile" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\mcuFinalCode\device" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\mcuFinalCode\device\periph" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\mcuFinalCode\utilities" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\mcuFinalCode\utilities\str" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\mcuFinalCode\utilities\debug_console_lite" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\mcuFinalCode\component\uart" -I"C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\mcuFinalCode\board" -O0 -fno-common -g3 -gdwarf-4 -c -ffunction-sections -fdata-sections -fno-builtin -imacros "C:\Users\eestaff\Documents\MCUXpressoIDE_24.12.148\workspace\mcuFinalCode\source\mcux_config.h" -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m0plus -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-utilities-2f-str

clean-utilities-2f-str:
	-$(RM) ./utilities/str/fsl_str.d ./utilities/str/fsl_str.o

.PHONY: clean-utilities-2f-str

