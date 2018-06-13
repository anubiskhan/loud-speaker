Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/auth/google_oauth2', as: :google_oauth2_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get :logout, to: 'sessions#destroy'
  resources :maps, only: [:new]
end
