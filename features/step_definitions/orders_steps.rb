# frozen_string_literal: true

Given("There are paid orders") do
  @orders = create_list(:order, 2, state: "paid")
end

Given("I am on the home page") do
  visit root_path
end

Given("I am on the orders page") do
  visit orders_path
end

Given("There are unpaid orders") do
  @unpaid_orders = create_list(:order, 2, state: "created")
end

Then("There is only the number of paid orders visible") do
  expect(page).to have_css(".data-row", count: @orders.count)
end
