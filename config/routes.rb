Rails.application.routes.draw do
  # ルーティングを追加してください
  post "thanks/:tweet_id/create" => "thanks#create"
  post "thanks/:tweet_id/destroy" => "thanks#destroy"

  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "users/:id/thanks" => "users#thanks"

  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"

  get "tweet/index" => "tweet#index"
  get "tweet/new" => "tweet#new"
  get "tweet/:id" => "tweet#show"
  post "tweet/create" => "tweet#create"
  get "tweet/:id/edit" => "tweet#edit"
  post "tweet/:id/update" => "tweet#update"
  post "tweet/:id/destroy" => "tweet#destroy"

  get "/" => "home#top"
  get "about" => "home#about"
end
