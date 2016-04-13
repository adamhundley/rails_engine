module Api
  module V1
    class Merchants::RevenueController  < ApiController
      def index
        respond_with Merchant.top_revenue(params[:quantity])
      end

      def show
        respond_with Merchant.total_revenue_by_date(params[:date]), serializer: MerchantTotalRevenueByDateSerializer
      end
    end
  end
end
