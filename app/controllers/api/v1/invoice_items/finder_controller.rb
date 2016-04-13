module Api
  module V1
    class InvoiceItems::FinderController  < ApiController
      include ApiBaseMethods
      private
        def strong_params
          params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
        end

        def model
          InvoiceItem
        end
    end
  end
end
