Rails.application.routes.draw do
  post 'users/create', to: "users#create", as: "users"
  get '/signup',  to: "users#new", as: "new_user"

  get '/login', to: "sessions#new", as: "new_session"
  post 'sessions/create', to: "sessions#create"


  resources :notes, only: [:create, :new, :index, :edit, :update, :show]
end
