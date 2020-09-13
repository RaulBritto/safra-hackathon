import random
import base64
from SafraAPI import SafraAPI
from DTO import *

class AuthenticationHandler:
    
    @staticmethod
    def GetAuthenticationToken():
        with open("auth.keys") as keyFile:
            keyNumber = random.randint(0,9)
            for i, line in enumerate(keyFile):
                if i == keyNumber:
                    return base64.b64encode(line.strip().encode()).decode('utf-8')

    @staticmethod
    def Login(accountId):
        token = AuthenticationHandler.GetCredential()
        user_data = SafraAPI.GetAccountData(token, accountId)
        #print(user_data)
        return DTOUserInfo(user_data)

    @staticmethod
    def GetCredential():
        tokenAuthorization = AuthenticationHandler.GetAuthenticationToken()
        apiKey = SafraAPI.GetOAUTHtoken(tokenAuthorization)
        return apiKey
    
