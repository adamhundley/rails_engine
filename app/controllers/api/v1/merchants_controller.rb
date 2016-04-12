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
        respond_with Merchant.find_by(find_params)
      end


      private
        def find_params
          params.permit(:id, :name)
        end
    end
  end
end
