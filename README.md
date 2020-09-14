# Safra Market

## Motivação

Conforme sondagem do SEBRAE, alguns donos de micro e pequenas empresas apresentam resistência ou desinformação sobre vendas pela internet. 
Entre os que não admitem o modelo online de negócio estão os menos escolarizados.
Pelo levantamento, empresários de pequeno porte com menor nível de estudo, são os que mais fecharam as portas de seus estabelecimentos em definitivo ou temporariamente por causa da Covid-19. 
De acordo com a pesquisa, 20,4% não sabem como a internet pode ser aplicada em seu negócio e 7,9% não vendia e nem pretende vender seus produtos por esse meio.


O Safra Market surge dessa necessidade, para auxiliar você a passar por essa transformação. 

Criamos um marketplace que facilita a ampliação das empresas em operações online, auxiliamos os pequenos a entrarem no mundo digital e assessoramos os grandes.

Você como lojista, acessa a plataforma e oferece seus produtos e serviços de forma online, contando com o Safra para virtualizar pagamentos e oferecer maior segurança a você e ao seu consumidor. 



[![IMAGE ALT TEXT](http://img.youtube.com/vi/wo7Q52r5ACI/0.jpg)](http://www.youtube.com/watch?v=wo7Q52r5ACI&feature=youtu.be "Safra Market")

# SafraMarketWebApp (BackEnd)

- BackEnd:
	O back-end cria a interface com a API open-bank Safra e com o banco de dados SafraMarket.

## Pacotes necessários

	- peewee==3.13.3
	- Flask==0.12.2
	- requests==2.14.2
	
## Uso (para teste)
 No diretório raiz (BackEnd/SafraMarketApp/)

	1- Executar:
		python src/SafraMarketWebApp.py
	

## Organização do Back:

	\BackEnd\SafraMarketApp # Root Folder
		src/	
			auth.keys
			Authentication.py
			DBHandle.py
			DTO.py
			Models.py
			ModelsDB.py
			pay.json
			Payload.py
			SafraAPI.py
			SafraMarketWebApp.py
			Service.py

# Front-end

[![IMAGE ALT TEXT](http://img.youtube.com/vi/BOFnJw5cg4Y/0.jpg)](http://www.youtube.com/watch?v=BOFnJw5cg4Y&feature=youtu.be "Safra Market - Demo")

## Uso (para teste)
	Para executar o código é necessário do Flutter (https://flutter.dev/) e do Android Studio. 

