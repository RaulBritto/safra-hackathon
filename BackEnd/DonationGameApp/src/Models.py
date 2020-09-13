from peewee import *

db = SqliteDatabase(None)
       
class BaseModel(Model):
    class Meta:
        database = db

class StoreDB(BaseModel):
    store_id = IntegerField(unique=True) 
    name = CharField()
    store_type = CharField()
    
class ProductDB(BaseModel):
    product_id = IntegerField(unique=True)
    store = ForeignKeyField(StoreDB, backref='product')
    name = CharField()
    price = FloatField()
    category = CharField()
    
class WarehouseDB(BaseModel):
    store_id = ForeignKeyField(StoreDB, backref='warehouse')
    product_id = ForeignKeyField(ProductDB, backref='warehouse')
    qtd = IntegerField()

class Product():
    def __init__(self, idProduct, description, value):
        self.product_id = idProduct
        self.name = description
        self.value = value

class ProductElement():
    def __init__(self, productID, qtd, value):
        self.productID = productID
        self.qtd = qtd
        self.TotalValue = qtd*value

class ShoppingCart():

    def __init__(self, account_id):
        self.account_id = account_id
        self.products = []
        self.total = 0

    def addToCart(self, ProductElement):
        self.products.append(ProductElement)
        self.total += ProductElement.TotalValue

    def removeFromCart(self, ProductElement):
        if ProductElement not in self.products:
            return
        else:
            self.products.remove(ProductElement)
            self.total -= ProductElement.TotalValue
            
    def getTotal(self):
        return self.total
    
class Schema:
    def __init__(self, dbFile):
        db.init(dbFile)
        db.connect()
        db.create_tables([StoreDB, ProductDB, WarehouseDB])