Rails.application.routes.draw do
  resources :gossips
  resources :cities
  resources :tags
  resources :messages
  get 'users/:id', to: 'static_pages#user_show'
  get 'gossips/:id', to: 'static_pages#show'
  get 'welcome/:first_name', to: 'static_pages#home'
  get 'contact', to: 'static_pages#contact'
  get '/index', to: 'gossips#index'
  get 'team', to: 'static_pages#team'
  get '/', to: 'static_pages#home'
  root to: 'staticpages#home'
end