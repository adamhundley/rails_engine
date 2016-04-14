module Api
  module V1
    class Merchants::CustomersWithPendingInvoicesController < ApiController
      def index
        respond_with Merchant.find(params[:merchant_id]).customers_with_pending_invoices
      end
    end
  end
end
