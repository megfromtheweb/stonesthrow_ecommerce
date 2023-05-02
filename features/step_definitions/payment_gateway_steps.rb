# frozen_string_literal: true

When("I click {string}") do |string|
  click_on string
end

Then("I am redirected to the payment complete page") do
  expect(page).to have_content("Thank you for your order")
end