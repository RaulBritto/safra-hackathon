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
        try:
            token = AuthenticationHandler.GetCredential()
            user_data = SafraAPI.GetAccountData(token, accountId)
        except:
            error_msg = "Error while trying to login."
            print(error_msg)
            user_data = SafraAPI.GetAccountData(true,error_msg)            
        finally:
            return DTOUserInfo(user_data)

    @staticmethod
    def GetCredential():
        tokenAuthorization = AuthenticationHandler.GetAuthenticationToken()
        apiKey = SafraAPI.GetOAUTHtoken(tokenAuthorization)
        return apiKey
    
