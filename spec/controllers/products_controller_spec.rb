# frozen_string_literal: true

require "rails_helper"

describe ProductsController do
  let(:primary_product) { create(:product) }
  let(:secondary_product) { create(:product) }
  let(:pebble) { create(:product, category: 'pebbles')}

  describe "GET index" do
    it "gets all products" do
      get :index
      expect(assigns[:products]).to include(primary_product)
    end

    it "gets all pebbles" do
      get :index, params: { category: 'pebbles' }
      expect(assigns[:products]).to include(pebble)
    end
    
    it "doesnt gets non pebbles" do
      get :index, params: { category: 'pebbles' }
      expect(assigns[:products]).not_to include(primary_product)
    end
  end

  describe "GET show" do
    it "gets intended product" do
      get :show, params: { id: primary_product.id }
      expect(assigns[:product]).to eq(primary_product)
    end
  end
end
