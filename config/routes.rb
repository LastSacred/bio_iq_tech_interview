Rails.application.routes.draw do
  root to: 'calculator#new'
  get '/calculator', to: 'calculator#new'
  post '/calculator', to: 'calculator#create', as: 'calculate'
end
