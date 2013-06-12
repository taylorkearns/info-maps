InfoMaps::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :maps, only: [:index, :show, :demo]

  match '/demo', to: 'maps#demo'

  root to: 'maps#index'

  ActiveAdmin.routes(self)
end
