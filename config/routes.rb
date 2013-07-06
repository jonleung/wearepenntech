WeArePennTech::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :comments #TODO, just allow for create, only enable the new and create, nest this
                      # Routes, this allows you to create things
                      # 
  resources :users
  resources :projects

  root :to => 'users#index'

end
