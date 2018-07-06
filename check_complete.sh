#!/bin/bash
#-------------------------------------------#
#-- Check system Raspberry Pi --------------#
#-- by: @cryptobr - on Telegram ------------#
#-------------------------------------------#

# Deps - install ethtool with ($ sudo apt-get install ethtool)

# Declarate Viriables
VAR='progressive'
CMD=$(tvservice -s)

echo "-------------------------"
echo "Raspberry PI - Status"
echo "Temperature: $(vcgencmd measure_temp | cut -c6-11)"
echo "Voltage: $(vcgencmd measure_volts | cut -c6-12)"
echo "CPU usage: $(awk '/cpu /{print 100*($2+$4)/($2+$4+$5)}' /proc/stat | cut -c1-4) %"
echo "MEM usage: $(cat /proc/meminfo | grep Active: | cut -c19-24) KB"
echo "Disk usage: $(df -h | cut -c35-36 | sed -n '2p') %"
echo "Inteface eth0 link: $(ethtool eth0 | grep "Link detected" | cut -c17-25)"
echo "Inteface wlan0 link: $(ethtool wlan0 | grep "Link detected" | cut -c17-25)"

if echo $CMD | grep $VAR > /dev/null
then
	echo "Cabe HDMI is on"
else
	echo "Cabe HDMI is off"
fi
echo "-------------------------"
