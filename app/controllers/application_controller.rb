# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def cart
    if session[:cart_id]
      Order.find(session[:cart_id])
    else
      cart = Order.create
      session[:cart_id] = cart.id
      cart
    end

    # TODO drop empty orders periodically
  end
end
