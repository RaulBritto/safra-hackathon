import random
import base64
from SafraAPI import SafraAPI

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
        return

    @staticmethod
    def GetCredential():
        tokenAuthorization = AuthenticationHandler.GetAuthenticationToken()
        apiKey = SafraAPI.GetOAUTHtoken(tokenAuthorization)
        return apiKey
