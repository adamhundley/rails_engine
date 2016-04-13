Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do

      namespace :merchants do
        get 'find', to: 'finder#show'
        get 'find_all', to: 'finder#index'
        get 'random', to: 'finder#random'
      end

      resources :merchants, only: [:index, :show] do
        resources :items, only: [:index], module: "merchants"
        resources :invoices, only: [:index], module: "merchants"
      end

      namespace :customers do
        get 'find', to: 'finder#show'
        get 'find_all', to: 'finder#index'
        get 'random', to: 'finder#random'
      end
      resources :customers, only: [:index, :show]

      namespace :items do
        get 'find', to: 'finder#show'
        get 'find_all', to: 'finder#index'
        get 'random', to: 'finder#random'
      end
      resources :items, only: [:index, :show]

      namespace :invoices do
        get 'find', to: 'finder#show'
        get 'find_all', to: 'finder#index'
        get 'random', to: 'finder#random'
      end
      resources :invoices, only: [:index, :show]

      namespace :invoice_items do
        get 'find', to: 'finder#show'
        get 'find_all', to: 'finder#index'
        get 'random', to: 'finder#random'
      end
      resources :invoice_items, only: [:index, :show]

      namespace :transactions do
        get 'find', to: 'finder#show'
        get 'find_all', to: 'finder#index'
        get 'random', to: 'finder#random'
      end
      resources :transactions, only: [:index, :show]
    end
  end
end
