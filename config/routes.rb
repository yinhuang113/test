Mapbuilder::Application.routes.draw do
  root :to => 'static_pages#home'
  
  match 'help', :to => 'static_pages#help'
  match '/about', :to => 'static_pages#about'
  match '/contact', :to => 'static_pages#contact'
  match '/malls/venu', :to => 'malls#venu', :as => 'venu_mall'
  match '/malls/mapbuilder', :to => 'malls#mapbuilder', :as => 'mapbuilder_mall'
  match '/profile', :to => 'profiles#index', :as => 'profile'
  
  devise_for :users
  
  resources :accounts
  resources :users

  resources :malls do
    resources :floors do
      get 'svg', on: :member
      get 'triangulation', on: :member
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
  
  scope module: "api" do
    match 'api/malls', to: 'malls#index', format: :json
    match 'api/malls/:id', to: 'malls#show', format: :json
    match 'api/malls/:id/navigation', to: 'malls#navigation', format: :json
    match 'api/floors', to: 'floors#index', format: :json
    match 'api/floors/:id', to: 'floors#show', format: :json
    match 'api/floors/:id/svg', to: 'floors#svg', format: :xml
    match 'api/floors/:id/triangulation', to: 'floors#triangulation'
    match 'api/stores', to: 'stores#index', format: :json
    match 'api/stores/:id', to: 'stores#show', format: :json
  end
end
