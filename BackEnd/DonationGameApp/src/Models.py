from peewee import *

db = SqliteDatabase(None)
       
class BaseModel(Model):
    class Meta:
        database = db

class Store(BaseModel):
    store_id = IntegerField(unique=True) 
    name = CharField()
    store_type = CharField()
    
class Product(BaseModel):
    product_id = IntegerField(unique=True)
    store = ForeignKeyField(Store, backref='product')
    name = CharField()
    price = FloatField()
    category = CharField()
    
class Warehouse(BaseModel):
    store_id = ForeignKeyField(Store, backref='warehouse')
    product_id = ForeignKeyField(Product, backref='warehouse')
    qtd = IntegerField()

class ShoppingCart(BaseModel):
    cart_id = IntegerField(unique=True)
    account_id = CharField()
    total = FloatField()

class Item(BaseModel):
    cart_id = ForeignKeyField(Shopping, backref='item')
    product_id = ForeignKeyField(Product, backref='item')
    qtd = IntegerField()
    total = FloatField()
    
class Schema:
    def __init__(self, dbFile):
        db.init(dbFile)
        db.connect()
        db.create_tables([Store, Product, Warehouse, ShoppingCart, Item])