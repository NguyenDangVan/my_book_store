Rails.application.routes.draw do
  root "static_page#home"

  get "sign_up", to: "users#new"
  post "sign_up", to: "users#create"
end
