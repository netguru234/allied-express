Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_scope :user do
    get "/login" => "devise/sessions#new" # custom path to login/sign_in
  end

  devise_for :users
  resources :contacts



  resources :shipments do
    resources :histories
  end

  get '/search', to: 'shipments#search'

  get '/about', to: 'welcome#about'
  get '/services', to: 'welcome#services'

  root 'welcome#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
