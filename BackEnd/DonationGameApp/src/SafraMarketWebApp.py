from flask import Flask, request, jsonify
from Authentication import AuthenticationHandler
from SafraAPI import SafraAPI
from Models import Schema
from DTO import JSONDTOEncoder

import logging
import sys, os
import json

Schema('../market_v2.db')
logging.basicConfig(level=logging.DEBUG)

app = Flask(__name__)
app.json_encoder = JSONDTOEncoder

@app.after_request
def add_headers(response):
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Headers'] =  "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With"
    response.headers['Access-Control-Allow-Methods']=  "POST, GET, PUT, DELETE, OPTIONS"
    return response

@app.route("/login", methods=["POST"])
def login():
    login_data = request.form
    #print("#################################################")
    #print(login_data['accountId'])
    response = AuthenticationHandler.Login(login_data['accountId'])
    print("#################################################")
    #print(response)
    #print(jsonify(response))
    print(jsonify(response))
    return jsonify(response)
    

@app.route("/Store/<accountId>", methods=["GET"])
def getLogin(accountId):
    token = AuthenticationHandler.GetCredential()
    response = SafraAPI.GetAccountData(token, accountId)
    return response["Data"]["Account"][0]["Nickname"]

@app.route('/', methods=["GET", "POST", "DELETE"])
def index():
    return "Safra Market!"

@app.route("/Store/<storeId>", methods=["GET"])
def getStore(storeId):
    return "Store " + storeId

@app.route("/Payment/<userId>", methods=["GET"])
def payment(userId):
    return "Pagamento " + userId

@app.route('/Add/<accountId>/<storeId>/<productId>/<quantity>')
def add_cart(accountId,storeId, productId, quantity):
    db_interactions.add_to_cart(accountId,storeId, productId, quantity)
    return db_interactions.return_cart_total()

@app.route("/about")
def About():
    return "About us"
    
if __name__ == "__main__":
    #Schema(os.path.join(os.path.dirname(os.path.abspath(__file__)),'..','presencecontrol.db'))
    app.run(debug=True, host='0.0.0.0')