module Api
  module V1
    class Merchants::InvoicesController  < ApiController
      def index
        respond_with Merchant.find(params[:merchant_id]).invoices
      end
    end
  end
end
