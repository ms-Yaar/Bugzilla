Rails.application.routes.draw do
  devise_for :users

  resources :bugs do
    get 'search', on: :collection
  end  
resources :projects

root "projects#index"




  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  require 'sidekiq/web'
  
mount Sidekiq::Web => '/sidekiq'
resources :projects do
  collection do
    get 'search' 
  end
end

resources :bugs do
  post :assign, on: :member
end
end





