from flask.json import JSONEncoder

class DTOResponse:
    def __init__(self, error=False, error_msg=""):
        self.error = error
        self.error_msg = error_msg

    def serialize(self):
        return {
            'error': self.error,
            'error_msg': self.error_msg
        }

class DTOUserInfo:
    def __init__(self, user_data, error=False, error_msg=""):
        self.accountId = user_data['Data']['Account'][0]['AccountId']
        self.nickname = user_data['Data']['Account'][0]['Nickname']
        self.error = error
        self.error_msg = error_msg
        
    def serialize(self):
        return {
            'accountId': self.accountId,
            'nickname': self.nickname,
            'error': self.error,
            'error_msg': self.error_msg
        }

class DTOProductInfo:
    def __init__(self, productId, productName, storeName, category, discount, error=False, error_msg=""):
        self.productId = productId
        self.productName = productName
        self.storeName = storeName
        self.price = price
        self.discount = discount
        self.error = error
        self.error_msg = error_msg

    def serialize(self):
        return {
            'productId': self.productId,
            'productName': self.productName,
            'storeName': self.storeName,
            'price': self.price,
            'discount': self.discount,
            'error': self.error,
            'error_msg': self.error_msg
            
class DTOStore:
    def __init__(self, store1=None, error=False, error_msg=""):
        self.store = store1
    
    def serialize(self):
        return {
            'storeName': self.store.name,
            'storeCategory': self.store.store_type,
        }

class DTOProductList:
    def __init__(self, productList=None, error=False, error_msg=""):
        self.productList = productList
    
    def serialize(self):
        return {
            'productList': self.productList
        }

class JSONDTOEncoder(JSONEncoder):
    def default(self, obj):
        if isinstance(obj, (DTOUserInfo,DTOProductInfo,DTOResponse)):
            return obj.serialize()
        elif isinstance(obj, DTOStore):
            return obj.serialize()
        elif isinstance(obj, DTOProductList):
            return obj.serialize()
        return super(JSONDTOEncoder, self).default(obj)

