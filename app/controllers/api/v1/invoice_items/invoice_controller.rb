module Api
  module V1
    class InvoiceItems::InvoiceController  < ApiController
      def index
        respond_with InvoiceItem.find(params[:invoice_item_id]).invoice
      end
    end
  end
end
