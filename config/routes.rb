SampleApp::Application.routes.draw do
  resources :tags, only: [:index, :update, :new, :create, :destroy]

  resources :people do
    resources :activities
    end

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions,   only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

  match '/filteractivities/:person_id/', to: 'activities#filtered_by_tags', via: :get, as: :filteredactivities
  match '/filter',  to: 'static_pages#filter', via: :get
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  root to: 'static_pages#home'
  # match '/', to: 'static_pages#home'

  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'


end
