module Api
  module V1
    class Items::MostItemsController  < ApiController
      def index
        respond_with Item.most_items(params[:quantity])
      end
    end
  end
end
