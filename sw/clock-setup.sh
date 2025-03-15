#!/bin/bash

# Must be root to install things
if [ $USER != "root" ]; then
    echo User must be root
    exit 1
fi

CFILE="/boot/firmware/config.txt"

# I2C Bus
if [ -z "$(grep -x "dtparam=i2c_arm=on" "$CFILE")" ]; then
    echo "dtparam=i2c_arm=on" >> "$CFILE"
    echo Add "dtparam=i2c_arm=on" to "$CFILE"
fi

if [ -z "$(grep -x "dtparam=i2c_arm_baudrate=400000" "$CFILE")" ]; then
    echo "dtparam=i2c_arm_baudrate=400000" >> "$CFILE"
    echo Add "dtparam=i2c_arm_baudrate=400000" to "$CFILE"
fi

# GPIO expanders
# Expander for second digits
if [ -z "$(grep -x "dtoverlay=mcp23017,addr=0x20,noints" "$CFILE")" ]; then
    echo "dtoverlay=mcp23017,addr=0x20,noints" >> "$CFILE"
    echo Add "dtoverlay=mcp23017,addr=0x20,noints" to "$CFILE"
fi

# Expander for minute digits
if [ -z "$(grep -x "dtoverlay=mcp23017,addr=0x21,noints" "$CFILE")" ]; then
    echo "dtoverlay=mcp23017,addr=0x21,noints" >> "$CFILE"
    echo Add "dtoverlay=mcp23017,addr=0x21,noints" to "$CFILE"
fi

# PWM for brightness
if [ -z "$(grep -x "dtoverlay=pwm,pin=18,func=2" "$CFILE")" ]; then
    echo "dtoverlay=pwm,pin=18,func=2" >> "$CFILE"
    echo Add "dtoverlay=pwm,pin=18,func=2" to "$CFILE"
fi

cp clock.py /usr/bin
cp set-pwm.sh /usr/bin
cp clock.service /etc/systemd/system
systemctl enable clock.service

# Timesyncd configuration
cp timesyncd.conf /etc/systemd/