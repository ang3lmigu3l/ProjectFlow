Rails.application.routes.draw do

  get 'projects/show'

  get 'projects/create'

  get 'projects/new'

  get 'projects/update'

  get 'projects/delete'

  resources :users, :only => [:show]

  devise_for :users

#   authenticated :user do
#   root to: "users#show", as: :authenticated_root
# end
  root 'welcome#index'

end
