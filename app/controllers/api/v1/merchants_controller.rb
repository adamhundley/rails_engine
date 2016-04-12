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
        respond_with Finder.find(controller,merchant_params)
      end

      def find_all
        respond_with Finder.find_all(controller,merchant_params)
      end

      def random
        respond_with Finder.random(controller)
      end

      private
        def merchant_params
          params.permit(:id, :name, :created_at, :updated_at)
        end

        def controller
          params[:controller]
        end
    end
  end
end
