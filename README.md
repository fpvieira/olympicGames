# olympicGames

Tem como objetivo computar resultados e retornar os vencedores de uma determinada competição.

Para utilizar o projeto.

bundle install
rails db:migrate
rails db:seed
bundle exec rspec spec
rails s

EndPoints.

Para listar modalidades:

	GET => http://localhost:3000/api/v1/disciplines/

	Resultado Esperado:
		[
			{
		    	"id": 2,
			    "name": "Javelin Throw",
			    "slug": javelin-throw,
			    "rule_type": "LongestThrownOnThreeAttemptsRule",
			},
			{
		    	"id": 1,
			    "name": "One Hundred Metre Dash",
			    "slug": one-hundred-metre-dash,
			    "rule_type": ShorterTimeOnOneAttemptsRule,
			},
		]

Lista todas as modalidades(disciplines) disponíveis, como foram solicitada apenas duas foram inseridas à partir do db:seed.

O campo rule_type representa o modo como o resultado de um atleta poderá ser computado e como são rankeados.

LongestThrownOnThreeAttemptsRule

	Todas as modalidades (disciplines) regidas por está regra, tem como características:
	=> Permite até 3 tentativas por atleta.
	=> Vence aquele que conseguir o maior número.

ShorterTimeOnOneAttemptsRule

	Todas as modalidades (disciplines) regidas por está regra, tem como características:
	=> Permite uma tentativa por atleta.
	=> Vence aquele que conseguir o menor número.

Para cadastrar uma competição:

	POST => http://localhost:3000/api/v1/disciplines/:discipline_slug/competitions
	
	Parâmetros no body: 
		name => String, Obrigatório

	Resultado Esperado:
		{
		    "id": 5,
		    "name": "Final",
		    "opened": true,
		    "discipline_id": 1,
		    "created_at": "2018-11-11T19:41:55.860Z",
		    "updated_at": "2018-11-11T19:41:55.860Z"
		}

Para cadastrar resultados para uma competição

	POST => http://localhost:3000/api/v1/disciplines/:discipline_slug/:competition_id/results

	Parâmetros no body: 
		name => String, Obrigatório
		result => Float, Obrigatório

	Resultado Esperado:
		{
		    "id": 31,
		    "name": "Felipe Vieira",
		    "result": 10.3,
		    "competition_id": 5,
		    "created_at": "2018-11-12T12:14:32.388Z",
		    "updated_at": "2018-11-12T12:14:32.388Z"
		}

Para visualizar resultados de uma competição

	GET => http://localhost:3000/api/v1/disciplines/:discipline_slug/:competition_id/results

	Resultado Esperado, quando ShorterTimeOnOneAttemptsRule:
		[
			{
		        "id": 32,
		        "name": "Felipe Vieira",
		        "result": [10.3],
		        "competition_id": 5,
    		},
    		{
		        "id": 15,
		        "name": "José das Couves",
		        "result": [10.31],
		        "competition_id": 5,
    		},
    		{
		        "id": 16,
		        "name": "Usain Bolt",
		        "result": [11.3],
		        "competition_id": 5,
    		}
    	]

	Resultado Esperado, quando LongestThrownOnThreeAttemptsRule:
		[
			{
		        "id": 33,
		        "name": "Felipe Vieira",
		        "result": [10.3, 55, 23],
		        "competition_id": 6,
    		},
    		{
		        "id": 18,
		        "name": "José das Couves",
		        "result": [10.31, 45, 13],
		        "competition_id": 6,
    		},
    		{
		        "id": 19,
		        "name": "Usain Bolt",
		        "result": [11.3, 33, 32],
		        "competition_id": 6,
    		}
    	]

Para encerrar uma competição

	POST => http://localhost:3000/api/v1/disciplines/:discipline_slug/:competition_id/finish

	Resultado Esperado:
		{
		    "id": 5,
		    "name": "Final",
		    "opened": false,
		    "discipline_id": 1,
		    "created_at": "2018-11-11T19:41:55.860Z",
		    "updated_at": "2018-11-11T19:41:55.860Z"
		}

TODO
	Ampiliar cobertura de testes
	Refatorar inicialização e utilização dos repositories
	Refatorar classes Rules
	Implementar métodos de autenticação.



Criar uma competição = DONE
Cadastrar resultados para uma competição = DONE
Finalizar uma competição = DONE
A API não deve aceitar cadastros de resultados se a competição já estiver encerrada. = DONE
A API pode retornar o ranking/resultado parcial, caso a disputa ainda não estiver encerrada. = DONE

No caso da competição do lançamento de dardos, cada atleta terá 3 chances, e o resultado da competição deverá levar em conta o lançamento mais distante de cada atleta. = DONE
	Deixar cadastrar em até 3 chances = DONE


#Conserar essa chamada > http://localhost:3000/api/v1/disciplines/javelin-throw/competitions/


Testes são obrigatórios.


#escrever o readme
#Conserar essa chamada > http://localhost:3000/api/v1/disciplines/javelin-throw/competitions/
#Trocar nome da classe ShorterTimeOnOneAttemptsRule
#Adicionar [] no seu final.
#Trocar use_cases para commands

#Acionar o Soares
	Contar pra ele a ideia de liberar somente com models e controller
	A idéia é ir implementando.
	Corrigindo durante o dia

#escrever os testes para controller
#pensar se vale mesmo inicializar os repositories com outro inicializando