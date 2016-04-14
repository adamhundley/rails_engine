module Api
  module V1
    class Merchants::RevenueByDateController < ApiController
      def show
        respond_with Invoice.total_revenue_by_date(params[:date]),
        serializer: MerchantTotalRevenueByDateSerializer
      end
    end
  end
end
