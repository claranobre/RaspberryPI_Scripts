#!/bin/bash

#-------------------------------------------#
#-- Check HDMI Raspberry Pi ----------------#
#-- by: @cryptobr - on Telegram ------------#
#-------------------------------------------#

VAR='progressive'
CMD=$(tvservice -s)

if echo $CMD | grep $VAR > /dev/null
then
	echo "HDMI is on"
else
	echo "HDMI is off"
	# For power on TV uncomment line bellow
	# tvservice -p
	# Case use Screenly service uncomment line bellow too
	# systemctl restart screenly\*
fi
