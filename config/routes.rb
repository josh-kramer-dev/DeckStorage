Rails.application.routes.draw do
  resources :users

  resources :users do
    resources :decks
    resources :formats
  end

  resources :decks do
    resources :cards
  end

  post '/decks/:id/cards/new', to: 'cards#create'

  root 'welcome#home'

  get '/login', to: 'sessions#new', as: 'login'
  post '/session', to: 'sessions#create', as: 'session'
  delete '/session/', to: 'sessions#destroy', as: 'logout'

  get '/auth/facebook/callback' => 'sessions#create'
end
