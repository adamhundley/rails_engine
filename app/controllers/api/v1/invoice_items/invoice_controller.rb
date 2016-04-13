module Api
  module V1
    class InvoiceItems::InvoiceController  < ApiController
      respond_to :json

      def index
        respond_with InvoiceItem.find(params[:invoice_item_id]).invoice
      end
    end
  end
end
