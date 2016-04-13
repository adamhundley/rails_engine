module Api
  module V1
    class MerchantsController < ApiController
      def index
        respond_with Merchant.all
      end

      def show
        respond_with Merchant.find(params[:id])
      end
    end
  end
end
