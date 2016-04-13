module Api
  module V1
    class Invoices::InvoiceItemsController  < ApiController
      respond_to :json

      def index
        respond_with Invoice.find(params[:invoice_id]).invoice_items
      end
    end
  end
end
