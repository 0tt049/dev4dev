# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
# Defines the root path route ("/")
# root "articles#index"

Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :slots do
    resources :gigs, only: %i[new create]
  end
  # get "slots/:slot_id/gigs/new", to: "gigs#new"
  # post "slots/:slot_id/gigs", to: "gigs#create"
end
