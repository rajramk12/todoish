Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :todos
  root "pages#home"
  get "/..." , to: "pages#home"
  get  "/about" , to: "pages#about"
  get "/help", to: "pages#help"
end
