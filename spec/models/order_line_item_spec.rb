# frozen_string_literal: true

require "rails_helper"

describe Order do
  context do
    let(:test_order) { create(:order) }
    let(:test_product) { create(:product) }

    describe "increase_quantity" do
      it "adds input to existing quantity" do
        test_line_item = create(:order_line_item, order_id: test_order.id, product_id: test_product.id, quantity: 1)
        test_line_item.increase_quantity(1)
        expect(test_line_item.quantity).to eq(2)
      end
    end

    describe "decrease_quantity" do
      it "subtracts input from existing quantity" do
        test_line_item = create(:order_line_item, order_id: test_order.id, product_id: test_product.id, quantity: 2)
        test_line_item.decrease_quantity(1)
        expect(test_line_item.quantity).to eq(1)
      end
    end

    describe "set_quantity" do
      it "replaces quantity with input" do
        test_line_item = create(:order_line_item, order_id: test_order.id, product_id: test_product.id, quantity: 2)
        test_line_item.set_quantity(1)
        expect(test_line_item.quantity).to eq(1)
      end
    end

    describe "destroy_if_zero" do
      it "does nothing if quantity is larger than 0" do
        test_line_item = create(:order_line_item, order_id: test_order.id, product_id: test_product.id, quantity: 2)
        expect { test_line_item.destroy_if_zero }.to_not change { test_order.order_line_items.count }
      end

      it "destroy item if quantity is not larger than 0" do
        test_line_item = create(:order_line_item, order_id: test_order.id, product_id: test_product.id, quantity: 0)
        expect { test_line_item.destroy_if_zero }.to change { test_order.order_line_items.count }
      end
    end
  end
end
