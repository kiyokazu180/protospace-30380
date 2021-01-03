Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  post "/prototypes/8" => "comments#create"
  resources :users
  resources :prototypes do
    resources :comments, only: :create
  end  
end
