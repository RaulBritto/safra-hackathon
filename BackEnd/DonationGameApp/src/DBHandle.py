from Models import *

Schema('../market.db')

class DBHandle():
    
    def GetProducts(self, productID= None):
        if not productID: 
           return [i.product_id for i in ProductDB.select()]
        else:
            if type(productID) is not list:
                return ProductDB.select().where(ProductDB.product_id == productID).get()
            else:
                return [ProductDB.select().where(ProductDB.product_id == _id).get() for _id in productID]

