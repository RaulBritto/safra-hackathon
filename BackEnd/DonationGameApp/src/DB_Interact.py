from Models import *

class ShoppingCart(BaseModel):
    cart_id = IntegerField(unique=True)
    account_id = CharField()
    total = FloatField()

class Item(BaseModel):
    cart_id = ForeignKeyField(Shopping, backref='item')
    product_id = ForeignKeyField(Product, backref='item')
    qtd = IntegerField()
    total = FloatField()



class DB_interact():
    
    def __init__(self):
        self.cart_id = 0
        self.cart_id = self.max_cart_id() + 1
        
    def max_cart_id(self):
        max_id = 0
        carts = ShoppingCart.select()
        for c in carts:
            max_id = max(max_id, c.cart_id)
        return max_id
    
    def create_cart(self, account_id):
        s = ShoppingCart.create(cart_id= self.cart_id,account_id = account_id,
                                total = 0)
        s.save()
        return

    def add_to_cart(self, account_id, product_id, quantity):
        prod_price = Product.select().where(Product.product_id == product_id)
        item = Item.create(cart_id= self.cart_id, product_id = product_id,
                           qtd = quantity, total = prod_price*quantity)
        item.save()
        
        
        
        return

    def return_cart_total(self):
        carts = ShoppingCart.select().where(ShoppingCart.cart_id == self.cart_id)
        total = 0
        for c in carts:
            product = Product.select().where(Product.product_id == c.product_id)
            for i in product:
                total += c.qtd * i.price
        return total