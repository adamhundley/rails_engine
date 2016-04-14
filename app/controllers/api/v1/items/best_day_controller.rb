module Api
  module V1
    class Items::BestDayController  < ApiController
      def show
        respond_with Item.find(params[:item_id]).best_day, serializer: BestDaySerializer
      end
    end
  end
end
