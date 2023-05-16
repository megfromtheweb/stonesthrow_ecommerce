# frozen_string_literal: true

class OrderService
  def self.create_line_item(order_id, params)
    OrderLineItem.create(order_id: order_id, product_id: params[:product_id], quantity: 1)
  end

  def self.update_line_item(order_id, params)
    if params[:quantity] == '0'
      delete_line_item(order_id, params)
    else
      if OrderLineItem.where(order_id: order_id, product_id: params[:product_id]).last
        cart_item = OrderLineItem.where(order_id: order_id, product_id: params[:product_id]).last
        quantity = cart_item.quantity + params[:quantity].to_i
        cart_item.update(quantity: quantity)
      else
        create_line_item(order_id, params)
      end
    end
  end

  def self.delete_line_item(order_id, params)
    cart_item = OrderLineItem.where(order_id: order_id, product_id: params[:product_id]).last
    cart_item.destroy
  end

  def self.get_line_items(order_id)
    product_ids = OrderLineItem.where(order_id: order_id).map(&:product_id)
    [Product.find(product_ids),OrderLineItem.where(order_id: order_id)]
  end

  def self.get_cart_total(order_id)
    OrderLineItem.where(order_id: order_id).map(&:quantity).sum
  end
end
