#!/bin/bash
#-------------------------------------------#
#-- by: @cryptobr - on Telegram ------------#
#-------------------------------------------#

mac=$(cat /home/pi/mac_check.txt)
iptables -A FORWARD -m mac --mac-source $mac -j DROP
