#!/bin/bash 

#-------------------------------------------#
#-- Check Speed Link Raspberry Pi ----------#
#-- by: @cryptobr - on Telegram ------------#
#-------------------------------------------#

# Install speedtest-cli with 'apt-get install speedtest-cli -y'

speedtest-cli > link.txt
cat link.txt | grep Upload | cut -c9-12 > uplink.txt
cat link.txt | grep Download | cut -c11-15 > downlink.txt
