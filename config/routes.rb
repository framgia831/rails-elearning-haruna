Rails.application.routes.draw do
 root "static_pages#home"

 get "/signup", to: "users#new"
 get "/login", to: "sessions#new"
 post "/login", to: "sessions#create"
 delete "/logout", to: "sessions#destroy"
 get "/users/:id/edit", to: "users#edit"

 resources :users, except: :new
 resources :relationships, only: [:create, :destroy]

 namespace :admin do
 	resources :categories do
 		resources :words
 		resources :choices
 	end
 end
 
end
