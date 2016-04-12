Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      
      namespace :merchants do
        get 'find', to: 'finder#show'
        get 'find_all', to: 'finder#index'
        get 'random', to: 'finder#random'
      end
      resources :merchants, only: [:index, :show]

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

      get 'invoices/find', to: 'invoices#find'
      get 'invoices/find_all', to: 'invoices#find_all'
      get 'invoices/random', to: 'invoices#random'
      resources :invoices, only: [:index, :show]
      get 'invoice_items/find', to: 'invoice_items#find'
      get 'invoice_items/find_all', to: 'invoice_items#find_all'
      get 'invoice_items/random', to: 'invoice_items#random'
      resources :invoice_items, only: [:index, :show]
      get 'transactions/find', to: 'transactions#find'
      get 'transactions/find_all', to: 'transactions#find_all'
      get 'transactions/random', to: 'transactions#random'
      resources :transactions, only: [:index, :show]
    end
  end
end
