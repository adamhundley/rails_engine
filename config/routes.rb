Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get 'merchants/find', to: 'merchants#find'
      get 'merchants/find_all', to: 'merchants#find_all'
      get 'merchants/random', to: 'merchants#random'
      resources :merchants, only: [:index, :show]
      get 'customers/find', to: 'customers#find'
      get 'customers/find_all', to: 'customers#find_all'
      get 'customers/random', to: 'customers#random'
      resources :customers, only: [:index, :show]
      get 'items/find', to: 'items#find'
      get 'items/find_all', to: 'items#find_all'
      get 'items/random', to: 'items#random'
      resources :items, only: [:index, :show]
    end
  end
end
