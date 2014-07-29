Rails.application.routes.draw do

  get 'sign_up' => 'users#new', :as => 'sign_up'
  get "users/:id" => "users#show", as: "user_show"
  get "users/:id/api_token" => "users#api_token", as: "user_api_token"
  resources :users

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  resources :sessions, only: [:new, :create, :destroy]

  resources :entries do
    resources :comments, shallow: true
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1, path: "" do
      resources :users, except: [:new, :edit]
      resources :entries, except: [:index, :new, :edit] do
        resources :comments, shallow: true
      end
    end
  end

  get 'home/index'

  root 'home#index'
end
