from Authentication import *
from ModelsDB import Schema
from Models import *
from DBHandle import DBHandle
from DTO import *
from SafraAPI import SafraAPI

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
    def pay(account, products_to_pay, APIKEY):
        productList = [i['id'] for i in products_to_pay['productList']]
        qtds = [i['quantity'] for i in products_to_pay['productList']]
        prices = db_interactions.GetProductsPrices(productList)
        total = 0
        for idx, pr in enumerate(prices):
            total += qtds[idx] * pr
        
        response, status = SafraAPI.Transfer(APIKEY, account, total)   
        if status == 201:
            return True
        
        return False
        
    @staticmethod
    def GetProducts(accountId):
        product_dto_list = []
        try:
            for product_id, product_name, store_name, product_price, product_category, product_discount in ProductDB.GetProductList():
                product_dto_list.append(DTOProductInfo(product_id, product_name, store_name, product_price, product_category, product_discount))
        except:
            raise
            return DTOResponse(True, "Error on get list of products")
        
        return product_dto_list