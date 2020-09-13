import requests
import json
from flask import jsonify

host = "https://af3tqle6wgdocsdirzlfrq7w5m.apigateway.sa-saopaulo-1.oci.customer-oci.com/fiap-sandbox"

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
        response_json = json.loads(response.text)
        
        return response_json['access_token']


    @staticmethod
    def GetAccountData(apiKey, accountId):

        url = host + "/open-banking/v1/accounts/" + accountId

        payload = {}
        headers = {
            'Authorization': 'Bearer ' + apiKey
        }

        response = requests.request("GET", url, headers=headers, data = payload)
        response_json = json.loads(response.text)

        return response_json

    @staticmethod
    def GetBalance(apiKey, accountId):
        url = host + "/open-banking/v1/accounts/" + accountId + "/balances"

        payload = {}
        headers = {
            'Authorization': 'Bearer ' + apiKey
        }

        response = requests.request("GET", url, headers=headers, data = payload)

        responseJson = json.loads(response.text)

        return responseJson


    @staticmethod
    def GetStatement(apiKey, accountId):
        url = host + "/open-banking/v1/accounts/" + accountId + "/transactions"

        payload = {}
        headers = {
        'Authorization': 'Bearer '+ apiKey
        }

        response = requests.request("GET", url, headers=headers, data = payload)

        responseJson = json.loads(response.text)

        return responseJson

  
    
    @staticmethod
    def Transfer(apiKey, accountId, dtoTransfer):
        url = host + "/accounts/v1/accounts/" + accountId + "/transfers"

        payload = jsonify(dtoTransfer)
        headers = {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + apiKey
        }

        response = requests.request("POST", url, headers=headers, data = payload)

        responseJson = json.loads(response.text)

        return responseJson


    @staticmethod
    def GetMorningCalls(apiKey, startDate = "2020-07-09", endDate = "2020-07-14", playlist = "morningCalls", channel = "safra"):
        url = host + "/media/v1/youtube?fromData=" + startDate +  "&toData=" + endDate + "&playlist=" + playlist + "&channel=" + channel

        payload = {}
        headers = {
            'Authorization': 'Bearer ' + apiKey
        }

        response = requests.request("GET", url, headers=headers, data = payload)

        responseJson = json.loads(response.text)

        return responseJson


    @staticmethod
    def OpenAccount(apiKey, name, email, phone):
        url = host + "/accounts/v1/optin"

        payload = json.dumps({"Name": name, "Email": email, "Phone": phone})

        headers = {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + apiKey
        }

        response = requests.request("POST", url, headers=headers, data = payload)

        responseJson = json.loads(response.text)

        return responseJson

    @staticmethod
    def CheckHealth(apiKey):
        url = host + "/health"

        payload = {}
        headers = {
            'Authorization': 'Bearer ' + apiKey
        }

        response = requests.request("GET", url, headers=headers, data = payload)

        responseJson = json.loads(response.text)

        return responseJson