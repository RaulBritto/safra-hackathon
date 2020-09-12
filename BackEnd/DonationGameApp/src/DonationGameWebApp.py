from flask import Flask, request, jsonify
from Authentication import AuthenticationHandler
from SafraAPI import SafraAPI

import logging
import sys, os
import json

logging.basicConfig(level=logging.DEBUG)

app = Flask(__name__)



@app.after_request
def add_headers(response):
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Headers'] =  "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With"
    response.headers['Access-Control-Allow-Methods']=  "POST, GET, PUT, DELETE, OPTIONS"
    return response

@app.route("/Store/<accountId>", methods=["GET"])
def getLogin(accountId):
    token = AuthenticationHandler.GetCredential()
    return "Usuario"

@app.route('/', methods=["GET", "POST", "DELETE"])
def index():
    return "Safra Market!"

@app.route("/Store/<storeId>", methods=["GET"])
def getStore(storeId):
    return "Store " + storeId

@app.route("/Payment/<userId>", methods=["GET"])
def payment(userId):
    return "Pagamento " + userId

@app.route("/about")
def About():
    return "About us"