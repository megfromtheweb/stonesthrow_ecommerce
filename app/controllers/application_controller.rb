# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :cart

  def cart
    if session[:cart_id]
      if Order.find_by(id: session[:cart_id])
        @cart = Order.find(session[:cart_id])
      else
        @cart = Order.create
        session[:cart_id] = @cart.id
      end
    else
      @cart = Order.create
      session[:cart_id] = @cart.id
    end
  end
    # TODO: drop empty orders periodically

  def clear_cart
    session.delete(:cart_id)
  end

  def not_found
    raise ActionController::RoutingError, "Not Found"
  rescue StandardError
    render_404
  end

  def render_404
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end
end
