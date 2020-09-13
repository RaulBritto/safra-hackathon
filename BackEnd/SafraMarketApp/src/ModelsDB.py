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

class Schema:
    def __init__(self, dbFile):
        db.init(dbFile)
        db.connect()
        db.create_tables([StoreDB, ProductDB, WarehouseDB])