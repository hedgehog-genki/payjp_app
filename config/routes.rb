Rails.application.routes.draw do
  get 'items/index'
  devise_for :users
  root "items#index"
end
