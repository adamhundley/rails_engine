module Api
  module V1
    class Merchants::ItemsController  < ApiController
      def index
        respond_with Merchant.find(params[:merchant_id]).items
      end

    end
  end
end
