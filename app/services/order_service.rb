class OrderService
  def self.create_list_item (order_id, product_id)
    if Purchase.where(order_id: order_id, product_id: product_id).last
      cart_item = Purchase.where(order_id: order_id, product_id: product_id).last
      debugger
      quantity = cart_item.quantity
      cart_item.update(quantity: quantity += 1)
    else
      Purchase.create(order_id: order_id, product_id: product_id, quantity: 1)
    end
  end
end