Mapbuilder::Application.routes.draw do
  root :to => 'static_pages#home'
  
  match 'help', :to => 'static_pages#help'
  match '/about', :to => 'static_pages#about'
  match '/contact', :to => 'static_pages#contact'

  match '/signup', :to => 'users#new'
  match '/login', :to => 'sessions#new'
  match '/logout', :to => 'sessions#destroy'

  resources :accounts
  resources :users
  resources :sessions

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
    resources :stores
  end

  resources :vendors
end
