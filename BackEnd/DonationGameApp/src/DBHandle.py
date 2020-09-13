from Models import *

Schema('../market.db')

class DBHandle():
    
    def GetProducts(self, storeID, productID= None):
        if not productID: 
           return [i.product_id for i in ProductDB.select()]
        else:
            if type(productID) is not list:
                return ProductDB.select().where(ProductDB.product_id == productID, ProductDB.store == storeID).get()
            else:
                return [ProductDB.select().where(ProductDB.product_id == _id, ProductDB.store == storeID).get() for _id in productID]

