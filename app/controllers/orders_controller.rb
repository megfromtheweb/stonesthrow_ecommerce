# frozen_string_literal: true

class OrdersController < ApplicationController
  def new

  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
  end
end
