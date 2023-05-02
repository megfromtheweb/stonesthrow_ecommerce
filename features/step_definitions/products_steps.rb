# frozen_string_literal: true

Given("I am on the products index page") do
  visit "/products/"
end

Given("There are multiple products") do
  @primary_product = create :product
  @secondary_product = create :product
end

Given("I am on the product show page") do
  visit "/products/#{@primary_product.id}"
end

Then("I see the product listed") do
  expect(page).to have_content(@primary_product.name)
end

Then("I see the product details") do
  expect(page).to have_content(@primary_product.name)
  expect(page).to have_content(@primary_product.price)
end
