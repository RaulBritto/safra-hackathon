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

#  SafraMarketWebApp (FrontEnd)
O Front-end do aplicativo oferece uma experiência amigável ao usuário do Safra Market em plataforma mobile. 
	
## Ferramenta:
Desenvolvido em Flutter, uma framework open-source criada pela Google para desenvolvimento de UI. Possui uma comunidade extensa, o que contribui para a utilização da plataforma.

## Uso (para teste):
	1- Instalar flutter e Android Studio.
	2- Abrir o projeto pelo Android Studio.
	3- Conectar o celular ao computador.
	4- Executar o projeto.
	
## Telas / Fluxo:
	1- Tela de Login
		- Efetua login
	2- Home Page
		- Seleciona produtos
	3- Cart Page
		- Altera quantidades
		- Confirma compra
	4- Confirmation Page
		- Mostra resultado da compra

## Organização:
	- lib
		- containers
			cart_product_container.dart
			product_container.dart
			store_container.dart
		- data
			database_helper.dart
			global_data.dart
			mock_data.dart
			rest_ds.dart
		- models
			product.dart
			store.dart
			user.dart
		- screens
			- cart
				cart_screen.dart
				failure_purchase.dart
				success_purchase.dart
			- home
				home_screen.dart
				home_screen_presenter.dart
			- login
				login_screen.dart
				login_screen.dart
		- utils
			network_util.dart
		auth.dart
		main.dart
		routes.dart
