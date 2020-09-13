from flask import Flask, request, jsonify
from Authentication import AuthenticationHandler
from SafraAPI import SafraAPI
from Service import SafraMarketService
from DTO import JSONDTOEncoder

import logging
import json

logging.basicConfig(level=logging.DEBUG)

controller = SafraMarketService()

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
    response = AuthenticationHandler.Login(login_data['accountId'])
    print(jsonify(response))
    return jsonify(response)

@app.route("/product_list/<accountId>", methods=["GET"])
def list_products(accountId):
    print("#################################################")
    print(SafraMarketService.GetProducts(accountId))
    return jsonify(SafraMarketService.GetProducts(accountId))

@app.route("/Store/<storeId>/items", methods=["GET", "POST"])
def getStore(storeId):
    store = controller.getStoreInfo(storeId)
    productList = controller.getProductsFromStore(storeId)
    return jsonify(store, productList)

@app.route('/', methods=["GET", "POST", "DELETE"])
def index():
    return "Safra Market!"

@app.route("/Payment/<userId>", methods=["GET",  "POST"])
def payment(userId):
    with open('pay.json') as json_file:
        data = json.load(json_file)
    payment_return = controller.pay(userId, data)      
    return jsonify(payment_return)

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')
