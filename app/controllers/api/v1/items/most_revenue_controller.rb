module Api
  module V1
    class Items::MostRevenueController  < ApiController
      def index
        respond_with Item.most_revenue(params[:quantity])
      end
    end
  end
end
