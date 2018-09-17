Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'accounts#create'

  resources :friends, only: %i[create destroy]
  resources :posts
  resources :replies, only: :create
end
