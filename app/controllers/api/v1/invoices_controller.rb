module Api
  module V1
    class InvoicesController < ApiController
      def index
        respond_with Invoice.all
      end

      def show
        respond_with Invoice.find(params[:id])
      end
    end
  end
end
