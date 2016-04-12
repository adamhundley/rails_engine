module Api
  module V1
    class CustomersController < ApiController
      respond_to :json

      def index
        respond_with Customer.all
      end

      def show
        respond_with Customer.find(params[:id])
      end

      def find
        respond_with Finder.find(controller, customer_params)
      end

      def find_all
        respond_with Finder.find_all(controller, customer_params)
      end

      def random
        respond_with Finder.random(controller)
      end

      private

        def customer_params
          params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
        end

        def controller
          params[:controller]
        end
    end
  end
end
