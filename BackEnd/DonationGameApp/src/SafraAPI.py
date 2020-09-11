import requests
from flask import jsonify

class SafraAPI:

    @staticmethod
    def GetOAUTHtoken(key):
        url = "https://idcs-902a944ff6854c5fbe94750e48d66be5.identity.oraclecloud.com/oauth2/v1/token"

        payload = "grant_type=client_credentials&scope=urn:opc:resource:consumer::all"
        headers = {
            'authorization': 'Basic ' + key,
            'cache-control': 'no-cache',
            'content-type': 'application/x-www-form-urlencoded',
            'postman-token': '280d6ac2-0e1c-d7ed-fc20-85de145f3d1c'
        }

        response = requests.request("POST", url, headers=headers, data = payload)

        print(response.text.encode('utf8'))

    @staticmethod
    def GetAccountData(apiKey, accountId):

        url = "https://af3tqle6wgdocsdirzlfrq7w5m.apigateway.sa-saopaulo-1.oci.customer-oci.com/fiap-sandbox/open-banking/v1/accounts/" + accountId

        payload = {}
        headers = {
            'Authorization': 'Bearer ' + apiKey
        }

        response = requests.request("GET", url, headers=headers, data = payload)

        print(response.text.encode('utf8'))

    @staticmethod
    def GetBalance(apiKey, accountId):
        url = "https://af3tqle6wgdocsdirzlfrq7w5m.apigateway.sa-saopaulo-1.oci.customer-oci.com/fiap-sandbox/open-banking/v1/accounts/" + accountId + "/balances"

        payload = {}
        headers = {
            'Authorization': 'Bearer ' + apiKey
        }

        response = requests.request("GET", url, headers=headers, data = payload)

        print(response.text.encode('utf8'))
    
    @staticmethod
    def Transfer(apiKey, accountId, dtoTransfer):
        url = "https://af3tqle6wgdocsdirzlfrq7w5m.apigateway.sa-saopaulo-1.oci.customer-oci.com/fiap-sandbox/accounts/v1/accounts/"+srcAccount+"/transfers"

        payload = jsonify(dtoTransfer)
        headers = {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + apiKey
        }

        response = requests.request("POST", url, headers=headers, data = payload)

        print(response.text.encode('utf8'))
