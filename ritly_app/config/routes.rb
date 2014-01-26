RitlyApp::Application.routes.draw do

  # Go Controller

  root to: "go#index"

  # resources :go

  # resources :links

  get "/go", to: "go#index"

  get "/go/:id", to: "go#redirect"

  get "/go/:id/preview", to: "go#preview"

  # Links Controller

  get "/links", to: "links#index"

  get "/links/new", to: "links#new"

  get "/links/:id", to: "links#show"

  post "/links", to: "links#create"

end
