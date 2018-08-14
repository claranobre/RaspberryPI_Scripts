# Create by: cryptobr - 2018
# You can use to provide the API the ip linked to the mac address, since some manufacturers do not let catch the mac by the app
# Get your mac addres with flask api GET request
# Device access: http://your_ip_server:5000/get_my_mac

from flask import request
from flask import Flask
import os

app = Flask(__name__)

@app.route("/get_my_mac", methods=["GET"])
def get_my_mac():
    ip = request.environ.get('HTTP_X_REAL_IP', request.remote_addr)
    mac = os.system("arp -a | grep "+ip+" | cut -c22-38 > /home/pi/mac_list.txt")
    f = open("/home/pi/mac_list.txt", "r")
    return (f.read())
              

if __name__ == '__main__':
    app.debug = True
    app.run(host = '0.0.0.0',port=5000)
