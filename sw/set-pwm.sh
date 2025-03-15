#!/bin/bash

if ! [ -d "/sys/class/pwm/pwmchip0/pwm0" ]; then
    echo 0 > /sys/class/pwm/pwmchip0/export
fi

# Duty cycle in percent
duty_cycle=100

if ! [ -z $1 ]; then
    duty_cycle=$1
fi

duty=$(expr 500 \* $duty_cycle)

echo 50000 > /sys/class/pwm/pwmchip0/pwm0/period
echo $duty > /sys/class/pwm/pwmchip0/pwm0/duty_cycle
echo 1 > /sys/class/pwm/pwmchip0/pwm0/enable
