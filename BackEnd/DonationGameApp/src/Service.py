from Authentication import *
from ModelsDB import Schema
from Models import *
from DBHandle import DBHandle

db_interactions = DBHandle()

class SafraMarketService:
    @staticmethod
    def login(accountId):
        AuthenticationHandler.GetAuthenticationToken()
    
    @staticmethod
    def getProductsFromStore(storeId):
        return db_interactions.GetProducts(storeId)
        
    @staticmethod
    def getStoreInfo(storeId):
        return db_interactions.GetStore(storeId)




        