Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do

      namespace :merchants do
        get 'find', to: 'finder#show'
        get 'find_all', to: 'finder#index'
        get 'random', to: 'finder#random'
        get 'most_revenue', to: 'revenue#index'
        get 'most_items', to: 'items_sold#index'
        get 'revenue', to: 'revenue_by_date#show'
      end
      resources :merchants, only: [:index, :show] do
        resources :items, only: [:index], module: "merchants"
        resources :invoices, only: [:index], module: "merchants"
        get 'revenue', to: 'merchants/revenue#show'
        get 'favorite_customer', to: 'merchants/favorite_customer#show'
        get 'customers_with_pending_invoices', to: 'merchants/customers_with_pending_invoices#index'
      end

      namespace :customers do
        get 'find', to: 'finder#show'
        get 'find_all', to: 'finder#index'
        get 'random', to: 'finder#random'
      end
      resources :customers, only: [:index, :show] do
        resources :invoices, only: [:index], module: "customers"
        resources :transactions, only: [:index], module: "customers"
        get 'favorite_merchant', to: "customers/favorite_merchant#show"
      end

      namespace :items do
        get 'find', to: 'finder#show'
        get 'find_all', to: 'finder#index'
        get 'random', to: 'finder#random'
        get 'most_revenue', to: 'most_revenue#index'
        get 'most_items', to: 'most_items#index'
      end
      resources :items, only: [:index, :show] do
        resources :invoice_items, only: [:index], module: "items"
        resources :merchant, only: [:index], module: "items"
        get 'best_day', to: "items/best_day#show"
      end

      namespace :invoices do
        get 'find', to: 'finder#show'
        get 'find_all', to: 'finder#index'
        get 'random', to: 'finder#random'
      end
      resources :invoices, only: [:index, :show] do
        resources :transactions, only: [:index], module: "invoices"
        resources :invoice_items, only: [:index], module: "invoices"
        resources :items, only: [:index], module: "invoices"
        resources :customer, only: [:index], module: "invoices"
        resources :merchant, only: [:index], module: "invoices"
      end

      namespace :invoice_items do
        get 'find', to: 'finder#show'
        get 'find_all', to: 'finder#index'
        get 'random', to: 'finder#random'
      end
      resources :invoice_items, only: [:index, :show] do
        resources :invoice, only: [:index], module: "invoice_items"
        resources :item, only: [:index], module: "invoice_items"
      end

      namespace :transactions do
        get 'find', to: 'finder#show'
        get 'find_all', to: 'finder#index'
        get 'random', to: 'finder#random'
      end
      resources :transactions, only: [:index, :show] do
        resources :invoice, only: [:index], module: "transactions"
      end
    end
  end
end
