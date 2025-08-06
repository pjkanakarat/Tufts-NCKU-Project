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
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_LPC51U68JBD64 -DCPU_LPC51U68JBD64_cm0plus -DMCUXPRESSO_SDK -DCORE_M0PLUS -DSDK_DEBUGCONSOLE=1 -DMCUX_META_BUILD -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\nckuee\Documents\Github\Tufts-NCKU-Project\source" -I"C:\Users\nckuee\Documents\Github\Tufts-NCKU-Project\drivers" -I"C:\Users\nckuee\Documents\Github\Tufts-NCKU-Project\CMSIS" -I"C:\Users\nckuee\Documents\Github\Tufts-NCKU-Project\CMSIS\m-profile" -I"C:\Users\nckuee\Documents\Github\Tufts-NCKU-Project\device" -I"C:\Users\nckuee\Documents\Github\Tufts-NCKU-Project\device\periph" -I"C:\Users\nckuee\Documents\Github\Tufts-NCKU-Project\utilities" -I"C:\Users\nckuee\Documents\Github\Tufts-NCKU-Project\utilities\str" -I"C:\Users\nckuee\Documents\Github\Tufts-NCKU-Project\utilities\debug_console_lite" -I"C:\Users\nckuee\Documents\Github\Tufts-NCKU-Project\component\uart" -I"C:\Users\nckuee\Documents\Github\Tufts-NCKU-Project\board" -O0 -fno-common -g3 -gdwarf-4 -c -ffunction-sections -fdata-sections -fno-builtin -imacros "C:\Users\nckuee\Documents\Github\Tufts-NCKU-Project\source\mcux_config.h" -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m0plus -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-component-2f-uart

clean-component-2f-uart:
	-$(RM) ./component/uart/fsl_adapter_usart.d ./component/uart/fsl_adapter_usart.o

.PHONY: clean-component-2f-uart

