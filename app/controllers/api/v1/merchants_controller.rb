module Api
  module V1
    class MerchantsController < ApiController
      respond_to :json
      def index
        
        respond_with Merchant.all
      end
    end
  end
end
