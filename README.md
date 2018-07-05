# RaspberryPI_Scripts

Varied scripts for raspberry and useful commands <br />


**Useful Commands** <br />

$ ethtool YOURINTERFACE | grep "Link detected" | cut -c17-25 // **check link interface** <br />
$ tshark -i YOURINTERFACE -f "src port 53" -n -T fields -e frame.time -e ip.src -e ip.dst -e dns.qry.name -e eth.dst -T ek >> LOGS-$(date +"%Y-%m-%d").json // **Navigation logs for json file (use in elasticsearch) - install tshark with (sudo apt-get install tshark)**
