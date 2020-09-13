from Authentication import *
from ModelsDB import Schema
from Models import *
from DBHandle import DBHandle
from DTO import *

db_interactions = DBHandle()

class SafraMarketService:
    @staticmethod
    def login(accountId):
        AuthenticationHandler.GetAuthenticationToken()
    
    @staticmethod
    def getProductsFromStore(storeId):
        object_dict = [{"id": p.id, "name": p.name, "price": p.price, "category": p.category} for p in db_interactions.GetProducts(storeId)]
        return DTOProductList(productList = object_dict) 
        
    @staticmethod
    def getStoreInfo(storeId):
        return DTOStore(store1 = db_interactions.GetStore(storeId)) 

    @staticmethod
    def pay(account, products_to_pay):
        productList = [i['id'] for i in products_to_pay['productList']]
        qtds = [i['quantity'] for i in products_to_pay['productList']]
        #Calcular total da compra
        prices = db_interactions.GetProductsPrices(productList)
        total = 0
        for idx, pr in enumerate(prices):
            total += qtds[idx] * pr
        return total



        