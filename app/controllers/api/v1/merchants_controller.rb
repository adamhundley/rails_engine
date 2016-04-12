module Api
  module V1
    class MerchantsController < ApiController
      respond_to :json

      def index
        respond_with Merchant.all
      end

      def show
        respond_with Merchant.find(params[:id])
      end

      def find
        respond_with MerchantFinder.find(merchant_params)
      end

      def find_all
        respond_with MerchantFinder.find_all(merchant_params)
      end

      private
        def merchant_params
          params.permit(:id, :name, :created_at, :updated_at)
        end
    end
  end
end
