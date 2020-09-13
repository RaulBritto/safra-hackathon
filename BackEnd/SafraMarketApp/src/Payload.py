
class Payload():

    def __init__(self):
        payload_gym = """{\r\n\t\r\n\t  \"Type\": \"TEF\",\r\n\t  \r\n\t  \r\n\t  \r\n    
                \"TransactionInformation\": \"Mensalidade Academia\",  
                \"DestinyAccount\": {\r\n       
                \"Bank\": \"422\",\r\n       
                \"Agency\": \"0071\",\r\n       
                \"Id\": \"1234533\",\r\n        
                \"Cpf\": \"12345678933\",\r\n       
                \"Name\": \"Mark Zuckerberg da Silva\",\r\n      
                \"Goal\":\"Credit\"\r\n    },\r\n\t\t   
                \"Amount\": {\r\n\t\t       
                             \"Amount\": \"250.00\",\r\n\t\t        
                             \"Currency\": \"BRL\"\r\n\t\t  
                             }\r\n\t\t\t\t\t  \r\n}"""
        payload_car = """{\r\n    \"Amount\": {\r\n        
        \"Amount\": \"8000.00\",\r\n        
        \"Currency\": \"BRL\"\r\n        },
        \r\n  
        \"DestinyAccount\": {\r\n     
                             \"Bank\": \"422\",\r\n  
                             \"Agency\": \"0071\",\r\n      
                             \"Id\": \"1234533\",\r\n  
                             \"Cpf\": \"12345678933\",\r\n    
                             \"Name\": \"Mark Zuckerberg da Silva\",\r\n 
                             \"Goal\":\"Credit\"\r\n    },\r\n   
        \"Type\": \"TEF\",\r\n   
        \"TransactionInformation\": \"Entrada Compra Carro\"\r\n}"""
        self.payload = {}
        self.payload['00711234511'] = payload_gym
        self.payload['00711234522'] = payload_car

    def GetPayloads(self, key):
        print(key)
        return self.payload.get(key, 'Error')
