Rails.application.routes.draw do

  resources :projects

  devise_for :users
  resources :users, :only => [:show]

  root 'welcome#index'

end
