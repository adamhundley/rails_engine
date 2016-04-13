module Api
  module V1
    class Invoices::CustomerController  < ApiController
      respond_to :json

      def index
        respond_with Invoice.find(params[:invoice_id]).customer
      end
    end
  end
end
