# frozen_string_literal: true

require "rails_helper"

describe OrdersController do
  describe "GET index" do
    let(:paid_order) { create(:order, state: "paid") }
    let(:created_order) { create(:order, state: "created") }

    it "gets orders that have been ordered" do
      get :index
      expect(assigns[:orders]).to include(paid_order)
    end

    it "does not get created orders" do
      get :index
      expect(assigns[:orders]).not_to include(created_order)
    end

    it "assigns correct page title" do
      get :index
      expect(assigns[:title]).to eq("Orders")
    end

    it "renders the index page" do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    context 'with paid order' do
      let(:paid_order) { create(:order, state: "paid") }
      let(:order_product) {create(:product)}
      let(:line_item) { create(:order_line_item, order_id: paid_order.id, product_id: order_product.id) }

      it "assigns correct page title" do
        get :show, params: { id: paid_order.id }
        expect(assigns[:title]).to eq("Order ##{paid_order.id}")
      end

      it "gets line items" do
        get :show, params: { id: paid_order.id }
        expect(assigns[:line_items]).to include(line_item)
      end

      it "assigns postage fee" do
        get :show, params: { id: paid_order.id }
        expect(assigns[:postage_fee]).to eq(0.75)
      end

      it "renders the show page" do
        get :show, params: { id: paid_order.id }
        expect(response).to render_template('show')
      end
    end
    context 'with an unordered cart' do
      let(:created_order) { create(:order, state: "created") }

      it "assigns correct page title" do
        get :show, params: { id: created_order.id }
        expect(assigns[:title]).to eq("Cart")
      end
    end
  end

  describe 'PATCH update' do
    let(:created_order) { create(:order, state: "created") }
    let(:order_product) {create(:product)}
    subject { patch :update, params: { id: created_order.id, quantity: 1 , product_id: order_product.id }}

    context 'with existing line item' do
      let(:line_item) { create(:order_line_item, order_id: created_order.id, product_id: order_product.id) }

      it 'updates order quantity' do
        expect { subject }.to change { line_item.reload.quantity }.from(1).to(2)
      end
    end
  end
end
