Rails.application.routes.draw do

  resources :users, :only => [:show]

  devise_for :users

#   authenticated :user do
#   root to: "users#show", as: :authenticated_root
# end
  root 'welcome#index'

end
