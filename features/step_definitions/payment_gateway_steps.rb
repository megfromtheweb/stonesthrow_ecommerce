# frozen_string_literal: true

When("I click {string}") do |string|
  click_on string
end

Then("I am redirected to the payment complete page") do
  expect(page).to have_content("Thank you for your order")
end

Then('A new order is created') do
  expect(Order.last.order_number).to eq(99999)
end