#!/bin/bash
# Requirements: 
# $ sudo apt-get install tshark speedometer hotp -y

name=monitor

if ! tmux has-session -t $name; then
  tmux start \;\
    new-session -d -s $name exit                                                  \;\
    neww -n monitor 'speedometer -r eth0 -t eth0'                               \;\
    splitw -v -p 60 'htop' \;\
    splitw -v -p 45 'ping google.com'                                              \;\
    splitw -h -p 60 'tshark -i wlan0 -f "src port 53" -n -T fields -e frame.time -e ip.src -e ip.dst -e dns.qry.name -e eth.dst'                                                         \;
fi

tmux attach -t monitor
