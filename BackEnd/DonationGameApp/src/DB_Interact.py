from Models import *

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

    def add_to_cart(self, account_id, store_id, product_id, quantity):
        s = ShoppingCart.create(cart_id= self.cart_id, store_id = store_id, product_id = product_id,
            qtd = quantity, account_id = account_id)
        s.save()
        return

    def return_cart_total(self):
        carts = ShoppingCart.select().where(ShoppingCart.cart_id == self.cart_id)
        total = 0
        for c in carts:
            product = Product.select().where(Product.product_id == c.product_id)
            for i in product:
                total += c.qtd * i.price
        return total