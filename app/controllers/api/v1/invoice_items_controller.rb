module Api
  module V1
    class InvoiceItemsController < ApiController
      respond_to :json

      def index
        respond_with InvoiceItem.all
      end

      def show
        respond_with InvoiceItem.find(params[:id])
      end

      def find
        respond_with Finder.find(controller, invoice_item_params)
      end

      def find_all
        respond_with Finder.find_all(controller, invoice_item_params)
      end

      def random
        respond_with Finder.random(controller)
      end

      private
        def invoice_item_params
          params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
        end

        def controller
          params[:controller]
        end
    end

  end
end
