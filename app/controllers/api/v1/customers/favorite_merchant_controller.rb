module Api
  module V1
    class Customers::FavoriteMerchantController < ApiController
      def show
        respond_with Customer.find(params[:customer_id]).favorite_merchant
      end
    end
  end
end
