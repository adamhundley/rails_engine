module Api
  module V1
    class Merchants::RevenueController < ApiController
      def index
        respond_with Merchant.top_revenue(params[:quantity])
      end

      def show
        respond_with Merchant.find(params[:merchant_id]).merchant_revenue(params[:date]), serializer: MerchantTotalRevenueSerializer
      end
    end
  end
end
