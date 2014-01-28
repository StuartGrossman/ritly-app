RitlyApp::Application.routes.draw do
  get "sessions/new"
  get "users/new"
  get "users/show"
  resources :users, :sessions

  root to: "go#index"

  # resources :go

  # resources :links

  # Go Controller
  get "/go", to: "go#index"

  get "/go/:id", to: "go#redirect"

  get "/go/:id/preview", to: "go#preview"

  # Links Controller

  get "/links", to: "links#index", as: :links

  get "/links/new", to: "links#new", as: :new_link

  get "/links/:id", to: "links#show", as: :link

  post "/links", to: "links#create"

  # Users and Sessions

  get '/signup', to: 'users#new'

  get'/signin', to: 'sessions#new'

  delete '/signout', to: 'sessions#destroy'

end
