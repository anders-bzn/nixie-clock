#!/usr/bin/env python3

import gpiod
import os
import time


chip0 = gpiod.Chip('0')
chip1 = gpiod.Chip('1')
chip2 = gpiod.Chip('2')
linesD0 = chip2.get_lines([3,2,1,0])
linesD1 = chip2.get_lines([7,6,5,4])
linesD2 = chip2.get_lines([11,10,9,8])
linesD3 = chip1.get_lines([3,2,1,0])
linesD4 = chip1.get_lines([7,6,5,4])
linesD5 = chip1.get_lines([11,10,9,8])

linesD0.request(consumer='clock', type=gpiod.LINE_REQ_DIR_OUT, default_vals=[0, 0, 0, 0])
linesD1.request(consumer='clock', type=gpiod.LINE_REQ_DIR_OUT, default_vals=[0, 0, 0, 0])
linesD2.request(consumer='clock', type=gpiod.LINE_REQ_DIR_OUT, default_vals=[0, 0, 0, 0])
linesD3.request(consumer='clock', type=gpiod.LINE_REQ_DIR_OUT, default_vals=[0, 0, 0, 0])
linesD4.request(consumer='clock', type=gpiod.LINE_REQ_DIR_OUT, default_vals=[0, 0, 0, 0])
linesD5.request(consumer='clock', type=gpiod.LINE_REQ_DIR_OUT, default_vals=[0, 0, 0, 0])

os.system('/usr/bin/set-pwm.sh 100')

chars={
    "0": (0, 0, 0, 0),
    "1": (0, 0, 0, 1),
    "2": (0, 0, 1, 0),
    "3": (0, 0, 1, 1),
    "4": (0, 1, 0, 0),
    "5": (0, 1, 0, 1),
    "6": (0, 1, 1, 0),
    "7": (0, 1, 1, 1),
    "8": (1, 0, 0, 0),
    "9": (1, 0, 0, 1),
}

last_second = -1

while True:
    t = time.strftime("%H%M%S")

    if not last_second == t[5]:
        linesD0.set_values(chars[t[5]])
        linesD1.set_values(chars[t[4]])
        linesD2.set_values(chars[t[3]])
        linesD3.set_values(chars[t[2]])
        linesD4.set_values(chars[t[1]])
        linesD5.set_values(chars[t[0]])
        last_second = t[5]
