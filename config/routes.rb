Rails.application.routes.draw do
  root to: "pages#home"
  resources :users
  resources :tutors
  resources :parents

  get "/dashboard", to: "pages#dashboard"
  get "/sign_in", to: "pages#sign_in"
  get "/sign_up", to: "pages#sign_up"
end
