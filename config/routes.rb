Rails.application.routes.draw do
  get 'welcome/home'
  resources :users

  resources :decks

  resources :decks do
    resources :cards
  end

  root 'welcome#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
