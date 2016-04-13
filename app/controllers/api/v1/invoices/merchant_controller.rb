module Api
  module V1
    class Invoices::MerchantController  < ApiController
      respond_to :json

      def index
        respond_with Invoice.find(params[:invoice_id]).merchant
      end
    end
  end
end
