Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/maps', to: 'maps#create'
    end
  end

  root 'welcome#index'

  get '/auth/google_oauth2', as: :google_oauth2_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get :logout, to: 'sessions#destroy'
  get '/cart', to: 'cart#show'
  resources :maps, only: [:new]
  resources :orders, only: [:new]

end
