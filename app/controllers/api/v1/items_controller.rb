module Api
  module V1
    class ItemsController < ApiController
      respond_to :json

      def index
        respond_with Item.all
      end

      def show
        respond_with Item.find(params[:id])
      end

      def find
        respond_with Finder.find(controller, item_params)
      end

      def find_all
        respond_with Finder.find_all(controller, item_params)
      end

      def random
        respond_with Finder.random(controller)
      end

      private

        def item_params
          params.permit(:id, :name, :unit_price, :merchant_id, :description, :created_at, :updated_at)
        end

        def controller
          params[:controller]
        end
    end
  end
end
