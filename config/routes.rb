Rails.application.routes.draw do

  resources :projects

  devise_for :users
  resources :users, :only => [:show]

  authenticated :user do
  root to: "users#flow", as: :authenticated_root
end

  root to: 'welcome#index'
    get '/profile' => 'users#profile'

end
