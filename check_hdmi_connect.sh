#!/bin/bash

VAR='progressive'
CMD=$(tvservice -s)

if echo $CMD | grep $VAR > /dev/null
then
	echo "HDMI is on"
else
	echo "HDMI is off"
fi
