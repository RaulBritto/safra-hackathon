from peewee import *

db = SqliteDatabase(None)
       
class BaseModel(Model):
    class Meta:
        database = db

class StoreDB(BaseModel):
    name = TextField()
    store_type = TextField()
    
class ProductDB(BaseModel):
    store_id = ForeignKeyField(StoreDB, backref='product')
    name = TextField()
    price = FloatField()
    category = TextField()
    discount = FloatField()

    @staticmethod
    def GetProductList():
        query = ProductDB.select()
        for product in query:
            store_name = StoreDB.get(StoreDB.id == product_id.store_id)
            yield product.id, product.name, store_name, product.price, product.category, product.discount
    
class WarehouseDB(BaseModel):
    store_id = ForeignKeyField(StoreDB, backref='warehouse')
    product_id = ForeignKeyField(ProductDB, backref='warehouse')
    qtd = IntegerField()

class Schema:
    def __init__(self, dbFile):
        db.init(dbFile)
        db.connect()
        db.create_tables([StoreDB, ProductDB, WarehouseDB])