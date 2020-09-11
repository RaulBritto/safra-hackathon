import random
import base64

class AuthenticationHandler:
    
    @staticmethod
    def GetAuthenticationToken():
        with open("auth.keys") as keyFile:
            keyNumber = random.randint(0,9)
            for i, line in enumerate(keyFile):
                if i == keyNumber:
                    return base64.b64decode(line)

    @staticmethod
    def Login(accountId):
