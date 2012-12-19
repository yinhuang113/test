Mapbuilder::Application.routes.draw do
  root :to => 'static_pages#home'
  
  match 'help', :to => 'static_pages#help'
  match '/about', :to => 'static_pages#about'
  match '/contact', :to => 'static_pages#contact'
  
  devise_for :users
  
  resources :accounts
  resources :users

  resources :floors, except: [:index] do
    get 'svg', on: :member
  end

  resources :malls do
    resources :floors do
      get 'svg', on: :member
      resources :entrances
    end
    resources :schedules do
      resources :schedule_intervals
    end
    resources :connectors
    resources :stores
    resources :zones
  end

  resources :vendors
end
