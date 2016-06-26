Rails.application.routes.draw do

  resources :projects

  devise_for :users
  resources :users, :only => [:show]

  root 'welcome#index'
    get '/profile' => 'users#profile'

end
