Rails.application.routes.draw do
  # devise_for :users
  
  
  namespace :api do
    namespace :v1 do
      get '/disciplines/', to: 'disciplines#index'
      get '/disciplines/:discipline_slug/competitions', to: 'competitions#index'
      post '/disciplines/:discipline_slug/competitions', to: 'competitions#create'
      get '/disciplines/:discipline_slug/competitions/:id', to: 'competitions#show'
      post '/disciplines/:discipline_slug/competitions/:id/finish', to: 'competitions#finish'
      post '/disciplines/:discipline_slug/competitions/:competition_id/result', to: 'results#create'
      # resources :disciplines, only: [:index], param: :slug do
      #   resources :competitions, param: :slug do
      #       resources :results
      #   end
      # end
    end
  end
end

# /disciplines/:discipline_slug/competitions/:competition_id/result
# http://localhost:3000/api/v1/disciplines/javelin-throw/competitions/1/result

# Competition(id: 1, slug: 'semi-finals', discipline:1),
# Competition(id: 2, slug: 'semi-finals', discipline:1),
# Competition(id: 3, slug: 'semi-finals', discipline:2),


# Achei que isso
# http://localhost:3000/api/v1/disciplines/natacao/competitions/semi-finals
# Era melhor que isso
# http://localhost:3000/api/v1/disciplines/1/competitions/1

#GET http://localhost:3000/api/v1/disciplines
# List all disciplines

#GET http://localhost:3000/api/v1/disciplines/:slug_discipline/
#List that discipline, because its a show.
# ->> Não tenho conteplado nem rota, nem controller para esse request, o correto era retornar um 404 ?

#GET http://localhost:3000/api/v1/disciplines/:slug_discipline/competitions/:slug_competition
#List all competitions by discipline

#É errado usar no plural ? Tipo disciplines ? Mesmo no show ?
#Outra dúvida, sou obrigado a implementar os outros verbos http, mesmo que não estejam sendo utilizados ?



# resources :brands, only: [:index, :show] do

# only: %i[index new create show destroy], param: :slug


#GET http://localhost:3000/api/v1/disciplines/<natacao>/competitions/<rio-semi-final-2014>/



#Ajustar chamadas das rotas
#Descobrir qual código devo retornar no caso de chamar uma rota que não existe e se isso tem importância.
#Gerar somente as rotas que são utilizadas
#bloquear parametros nao desejados
#solicitar parametros que sao obrigatorios
#escrever os uses_cases de registro do resultado
#escrever os testes