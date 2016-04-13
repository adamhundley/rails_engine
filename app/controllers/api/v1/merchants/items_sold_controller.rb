module Api
  module V1
    class Merchants::ItemsSoldController  < ApiController
      def index
        respond_with Merchant.most_items(params[:quantity])
      end
    end
  end
end
