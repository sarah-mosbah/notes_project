Rails.application.routes.draw do
  post 'users/create', to: "users#create", as: "users"
  get '/signup',  to: "users#new", as: "new_user"

  get '/login', to: "sessions#new", as: "new_session"
  post 'sessions/create', to: "sessions#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
