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
from flask import request
from flask import jsonify
from flask import Flask
import os
import requests
from requests_jwt import JWTAuth


app = Flask(__name__)

@app.route("/get_my_mac", methods=["GET"])
def get_my_mac():
    ip = request.environ.get('HTTP_X_REAL_IP', request.remote_addr)
    mac = os.system("arp -a | grep "+ip+" | cut -c22-38 > /home/pi/mac_check.txt")
    f = open("/home/pi/mac_check.txt", "r")
    return (f.read())

@app.route("/check_me", methods=["GET"])
def check_me():
    ip = request.environ.get('HTTP_X_REAL_IP', request.remote_addr)
    mac = os.system("arp -a | grep "+ip+" | cut -c22-38 > /home/pi/mac_check.txt")
    auth = JWTAuth('YOur JWT')
    f = open("/home/pi/mac_check.txt", "r")
    out = requests.get("https://YOur_API_For_Check/"+str(mac), auth=auth)
    if str(out).find('200') != -1:
        return "MAC Free"
    else:
        os.system("cat /home/pi/mac_check.txt >> /home/pi/mac_block.txt")
        os.system("sh /home/pi/scripts/block_mac.sh") # Download (https://raw.githubusercontent.com/crypto-br/RaspberryPI_Scripts/master/block_mac.sh)
        return "MAC Block"
    
             
if __name__ == '__main__':
    app.debug = True
    app.run(host = '0.0.0.0',port=5000)
