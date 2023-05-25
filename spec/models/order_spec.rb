# frozen_string_literal: true

require "rails_helper"

describe Order do
  context do
    let(:test_order) { create(:order) }
    let(:test_products) { create_list(:product, 3) }

    describe "total_quantity" do
      before do
        line_items = []
        test_products.each do |product|
          line_items.append(create(:order_line_item, order_id: test_order.id, product_id: product.id))
        end
      end

      it "returns sum of line item quantities" do
        expect(test_order.total_quantity).to eq(3)
      end
    end
  end
end
