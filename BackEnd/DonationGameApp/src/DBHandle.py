from ModelsDB import *

Schema('../market.db')

class DBHandle():
    
    def GetProducts(self, storeID, productID= None):
        if not productID: 
           return [i for i in ProductDB.select().where(ProductDB.store == storeID)]
        else:
            if type(productID) is not list:
                return ProductDB.select().where(ProductDB.product_id == productID, ProductDB.store == storeID).get()
            else:
                return [ProductDB.select().where(ProductDB.product_id == _id, ProductDB.store == storeID).get() for _id in productID]
    
    def GetProductsPrices(self, productsID):
         return [ProductDB.select().where(ProductDB.product_id == _id).get().price for _id in productsID]
        

    def GetStore(self, storeID):
        return StoreDB.select().where(StoreDB.store_id == storeID).get()
