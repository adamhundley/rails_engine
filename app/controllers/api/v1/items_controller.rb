module Api
  module V1
    class ItemsController < ApiController
      def index
        respond_with Item.all
      end

      def show
        respond_with Item.find(params[:id])
      end
    end
  end
end
