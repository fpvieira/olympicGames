Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/disciplines/', to: 'disciplines#index'
      post '/disciplines/:discipline_slug/competitions', to: 'competitions#create'
      post '/disciplines/:discipline_slug/competitions/:id/finish', to: 'competitions#finish'
      post '/disciplines/:discipline_slug/competitions/:competition_id/results', to: 'results#create'
      get '/disciplines/:discipline_slug/competitions/:competition_id/results', to: 'results#index'
    end
  end
end