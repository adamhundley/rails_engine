module Api
  module V1
    class InvoiceItems::ItemController  < ApiController
      def index
        respond_with InvoiceItem.find(params[:invoice_item_id]).item
      end
    end
  end
end
