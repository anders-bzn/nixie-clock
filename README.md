# About the Nixie Clock

This is a clock powered by a Raspberry Pi Zero W. It fetches current time by 
NTP and must be connected to a WiFi network to display the time.

The time is displayed on six IN-14 nixie tubes driven by six 74141. No 
multipexling! The intensity can be adjusted by PWM.

![Clock front](pictures/front.jpg)
![Clock back](pictures/back.jpg)
![Clock bottom](pictures/bottom.jpg)

## PCB's 
There are in total five PCB's in this project.

### Board nixie-bottom
Bottom lid, no electrical function.
### Board nixie-clock
The main board, it hold gpio-expanders and drive IC's for the tubes.
### Board nixie-clock-psu
Power supply board, creates 5V DC and 170V DC from 12V DC.
### Board nixie-clock-tubes
Upper board on which all tubes are mounted.
### Board nixie-top
Top lid, no electrical function.
### Software
Copy the ./sw folder to the Raspberry Pi and install the software by:

```
$ sudo clock-setup.sh
$ sudo reboot
```

NOTE: ./sw/timesyncd.conf is an example. 
