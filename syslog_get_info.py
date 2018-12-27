from flask import request
from flask import Flask
import os


app = Flask(__name__)

@app.route('/get_log/<mac>', methods=['GET'])
def get_log(mac):
        logmac= os.system("cat log_file.log | egrep "+mac+" > mac_log.txt")
        f = open("mac_log.txt", "r")
        return (f.read())

if __name__ == '__main__':
        app.debug= True
        app.run(host = '0.0.0.0', port=5000)
