InfoMaps::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :regions

  match '/demo', to: 'regions#demo'

  root to: 'regions#index'

  ActiveAdmin.routes(self)
end
