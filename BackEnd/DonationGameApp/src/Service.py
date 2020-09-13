from Authentication import *
from DTO import *
from ModelsDB import *

class SafraMarketService:
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


        