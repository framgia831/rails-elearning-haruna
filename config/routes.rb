Rails.application.routes.draw do
 root "static_pages#home"

 get "/signup", to: "users#new"
 get "/login", to: "sessions#new"
 post "/login", to: "sessions#create"
 delete "/logout", to: "sessions#destroy"
 get "/users/:id/edit", to: "users#edit"
 get "/categories", to: "lessons#index"
 get "/home", to: "activities#home"

 resources :users, except: :new do
 	get "/followers", to: "users#followers"
 	get "/following", to: "users#following"
 end

 resources :relationships, only: [:create, :destroy]
 resources :activities

 resources :lessons, except: :index do
 	resources :answers
 end

 namespace :admin do
 	resources :users
 	get "/home", to: "users#home"
 	resources :categories do
 		resources :words do
 			resources :choices
 		end
 	end
 end
 
end
