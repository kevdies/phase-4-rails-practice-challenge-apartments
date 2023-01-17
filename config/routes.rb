Rails.application.routes.draw do

  resources :leases, only: [:create, :destroy]
  resources :tenants, only: [:index, :show, :update, :destory]
  resources :apartments, only: [:index, :show, :create, :update, :destroy]
end
