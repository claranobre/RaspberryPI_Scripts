# RaspberryPI_Scripts

Varied scripts for raspberry and useful commands <br />


**Useful Commands** <br />

$ ethtool YOURINTERFACE | grep "Link detected" | cut -c17-25 // **check link interface** <br /> <br />
$ tshark -i YOURINTERFACE -f "src port 53" -n -T fields -e frame.time -e ip.src -e ip.dst -e dns.qry.name -e eth.dst -T ek >> LOGS-$(date +"%Y-%m-%d").json // **Navigation logs for json file (use in elasticsearch) - install tshark with (sudo apt-get install tshark)** <br /> <br />
$ vcgencmd measure_temp // **Get temperature** <br /> <br />
$ vcgencmd measure_volts // **Get Voltage** <br /> <br />
$ awk '/cpu /{print 100*($2+$4)/($2+$4+$5)}' /proc/stat | cut -c1-4 // **Get CPU % use** <br /> <br />
$ cat /proc/meminfo | grep Active: | cut -c19-24 // **Get MEM use in Kbytes** <br /> <br />
$ df -h | cut -c35-36 | sed -n '2p' // **Get DISK % use** <br /> <br />
