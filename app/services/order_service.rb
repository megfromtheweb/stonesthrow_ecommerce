# frozen_string_literal: true

class OrderService
  def self.create_line_item(order_id, product_id)
    if OrderLineItem.where(order_id: order_id, product_id: product_id).last
      cart_item = OrderLineItem.where(order_id: order_id, product_id: product_id).last
      quantity = cart_item.quantity
      cart_item.update(quantity: quantity + 1)
    else
      OrderLineItem.create(order_id: order_id, product_id: product_id, quantity: 1)
    end
  end
end
