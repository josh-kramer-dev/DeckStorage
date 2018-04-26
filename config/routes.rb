Rails.application.routes.draw do
  resources :users

  resources :decks

  resources :decks do
    resources :cards
  end

  root 'welcome#home'

  get '/login', to: 'sessions#new', as: 'login'
  post '/session', to: 'sessions#create', as: 'session'
  delete '/session/', to: 'sessions#destroy', as: 'logout'

  get '/auth/facebook/callback' => 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
