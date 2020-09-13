# Safra Market
Repositório para projeto da Hackathon technee do Banco Safra

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
## Uso (para teste)
 No diretório raiz (BackEnd/SafraMarketWebApp/)

1- Executar:
	python src/SafraMarketWebApp.py
2- Run the application on the FrontEnd folder (FrontEnd/presence-control-app/), see instructions in its README.md file

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
