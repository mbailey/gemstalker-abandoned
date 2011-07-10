GemStalker::Application.routes.draw do

  namespace :admin do
    resources :follows
    resources :users
    resources :rubygems do
      resources :releases
      get 'snoop', :on => :member
    end
  end


  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  resources :users
  resources :sessions

  # root :to => 'admin/rubygems#index'
  root :to => 'users#home'

  resources :follows

  match ':rubygem/follow' => 'follows#create', :as => :follow
  match ':rubygem/unfollow' => 'follows#destroy', :as => :unfollow

  match ':name' => 'rubygems#show', :as => :rubygem

end
