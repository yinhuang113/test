Mapbuilder::Application.routes.draw do
  root :to => 'static_pages#home'
  
  match 'help', :to => 'static_pages#help'
  match '/about', :to => 'static_pages#about'
  match '/contact', :to => 'static_pages#contact'

  match '/signup', :to => 'users#new'
  match '/login', :to => 'sessions#new'
  match '/logout', :to => 'sessions#destroy'

  resources :users
  resources :sessions
  resources :malls
end