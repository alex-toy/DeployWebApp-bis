import logging.config
import os
from flask import Flask, request, jsonify, render_template, redirect, url_for
import requests
import json
from flask import make_response
from urllib.parse import urljoin

app = Flask(__name__)

request_url = "https://alexeifa.azurewebsites.net/api/"

@app.route('/getusers')
def getusers():
    action = "getusers"
    url = f"{request_url}{action}"
    response = requests.get(url)
    users = response.json()
    return render_template("index.html", users=users)


@app.route('/getuser')
def getuser():
    action = "getuser"
    name = request.args.get('name')
    url = f"{request_url}{action}?name={name}&code=kBG3SGmUZTOwUPFy-C-jTE218Y44UlZMT2UiFDPE3_Z_AzFu_DjnBA=="
    response = requests.get(url)
    user_description = response.json()
    return render_template("user.html", user_description=user_description)


def main():
    app.run(host='0.0.0.0', debug=True)

if __name__ == '__main__':
    main()
