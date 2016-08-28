Rails.application.routes.draw do

  resources :posts

  

  devise_for :users
  
  authenticated :user do
    root "posts#index", as: "authenticated_root"
  end

  root 'welcome#index'

end
