Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  resources :users, except: :new
  resources :todos

  root "pages#home"

  get "/..." , to: "pages#home"
  get  "/about" , to: "pages#about"
  get "/help", to: "pages#help"

end
