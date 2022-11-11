Rails.application.routes.draw do
  root "authors#home"

  resources :authors
  resources :books
end
