# olympicGames

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
#Trocar use_cases para commands

#Acionar o Soares
	Contar pra ele a ideia de liberar somente com models e controller
	A idéia é ir implementando.
	Corrigindo durante o dia

#escrever os testes para controller
#pensar se vale mesmo inicializar os repositories com outro inicializando


Tem como objetivo computar resultados e retornar os vencedores de uma determinada competição.

Para utilizar o projeto.

bundle install
rails db:migrate
rails db:seed
bundle exec rspec spec
rails s

EndPoints.

GET => http://localhost:3000/api/v1/disciplines/

Lista todas as modalidades(disciplines) disponíveis, como foram solicitada apenas duas foram inseridas à partir do db:seed.

POST => http://localhost:3000/api/v1/disciplines/:discipline_slug/competitions
	Parâmetros: 
		Name => String, Obrigatório

	Resultado Esperado:
		{
		    "id": 5,
		    "name": "Lançamento de Dardos - 4 Fase",
		    "opened": true,
		    "discipline_id": 2,
		    "created_at": "2018-11-11T19:41:55.860Z",
		    "updated_at": "2018-11-11T19:41:55.860Z"
		}


http://localhost:3000/api/v1/disciplines/javelin-throw/competitions/
http://localhost:3000/api/v1/disciplines/one-hundred-metre-dash/competitions/