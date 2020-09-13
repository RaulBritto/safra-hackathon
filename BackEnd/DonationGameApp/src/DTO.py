from flask.json import JSONEncoder

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

class JSONDTOEncoder(JSONEncoder):
    def default(self, obj):
        if isinstance(obj, DTOUserInfo):
            return obj.serialize()
        return super(JSONDTOEncoder, self).default(obj)

