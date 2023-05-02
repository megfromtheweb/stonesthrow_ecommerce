# frozen_string_literal: true

require "rails_helper"

describe ProductsController do
  let(:primary_product) { create(:product) }
  let(:secondary_product) { create(:product) }

  describe "GET index" do
    it "gets all products" do
      get :index
      expect(assigns[:products]).to include(primary_product)
    end
  end

  describe "GET show" do
    it "gets intended product" do
      get :show, params: { id: primary_product.id }
      expect(assigns[:product]).to eq(primary_product)
    end
  end
end
