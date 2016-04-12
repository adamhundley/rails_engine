module Api
  module V1
    class InvoicesController < ApiController
      respond_to :json

      def index
        respond_with Invoice.all
      end

      def show
        respond_with Invoice.find(params[:id])
      end

      def find
        respond_with Finder.find(controller,
        invoice_params)
      end

      def find_all
        respond_with Finder.find_all(controller, invoice_params)
      end

      def random
        respond_with Finder.random(controller)
      end

      private

      def invoice_params
        params.permit(:id, :status, :merchant_id, :customer_id, :created_at, :updated_at)
      end

      def controller
        params[:controller]
      end
    end
  end
end
