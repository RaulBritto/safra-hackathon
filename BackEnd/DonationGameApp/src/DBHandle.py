from Models import *

Schema('../market.db')

class DBHandle():
    
    def GetProducts(self, productID= None):
        if not productID: 
           return [i.product_id for i in ProductDB.select()]
        else:
            return ProductDB.select().where(ProductDB.product_id == productID).get()
