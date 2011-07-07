GemFollow::Application.routes.draw do

  namespace :admin do
    resources :follows
    resources :users
    resources :rubygems do
      resources :releases
      get 'snoop', :on => :member
    end
  end

  root :to => 'admin/rubygems#index'

  match ':name' => 'rubygems#show', :as => :gem_page

end
