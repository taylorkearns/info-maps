InfoMaps::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  root to: 'maps#index'

  ActiveAdmin.routes(self)
end
