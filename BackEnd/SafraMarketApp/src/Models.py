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