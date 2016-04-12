Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do

      get ':model/find', to: 'finder#find'
      get ':model/find_all', to: 'finder#find_all'
      get ':model/random', to: 'finder#random'
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :merchants, only: [:index, :show]
    end
  end
end
