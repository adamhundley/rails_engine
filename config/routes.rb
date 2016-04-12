Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get 'merchants/find', to: 'merchants#find'
      resources :merchants, only: [:index, :show] do
      end
    end
  end
end
