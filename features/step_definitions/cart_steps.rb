# frozen_string_literal: true
Given('there are items in my cart') do
  step("I click 'Add to Cart'")
end

When("I click {string}") do |string|
  click_on string
end

Then('I see the items listed') do
  expect(page).to have_content(@primary_product.name)
end

Then("I see cart count increase") do
  expect(page).to have_content("Cart (1)")
end

Then('I do not see that item in my cart') do
  expect(page).to have_content("Your cart is empty")
end


