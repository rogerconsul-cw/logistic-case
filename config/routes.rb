Rails.application.routes.draw do
  root to: 'front_page#front_page'

  get 'search', to: 'front_page#search'

  resources :authors
  resources :books

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
