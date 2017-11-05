Rails.application.routes.draw do
  root to: "pages#home"
  resources :users
  resources :tutors
  resources :parents
  resources :reviews
  resources :childs

  get "/dashboard", to: "pages#dashboard"
  get "/sign_in", to: "pages#sign_in"
  get "/sign_up", to: "pages#sign_up"
  get "/sign_up", to: "pages#sign_up"
  post "/sign_in", to: "sessions#create"
  delete '/sign_out', to: 'sessions#destroy'
end
