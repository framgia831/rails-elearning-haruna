Rails.application.routes.draw do
 root "static_pages#home"

 get "/signup", to: "users#new"
 get "/login", to: "sessions#new"
 post "/login", to: "sessions#create"
 delete "/logout", to: "sessions#destroy"
 get "/users/:id/edit", to: "users#edit"
 get "/categories", to: "lessons#index"

 resources :users, except: :new
 resources :relationships, only: [:create, :destroy]
 resources :lessons, except: :index
 resources :answers

 namespace :admin do
 	resources :categories do
 		resources :words do
 			resources :choices
 		end
 	end
 end
 
end
