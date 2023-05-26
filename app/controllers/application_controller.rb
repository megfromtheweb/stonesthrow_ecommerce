# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :cart

  def cart
    if session[:cart_id]
      @cart = Order.find(session[:cart_id])
    else
      @cart = Order.create
      session[:cart_id] = @cart.id
    end

    # TODO: drop empty orders periodically
  end

  def clear_cart
    session.delete(:cart_id)
  end
end
