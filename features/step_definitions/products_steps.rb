Given('I am on the products index page') do
  visit "/products/"
end

Given('There is a product') do
  @primary_product = create :product
end

Then('I see the product listed') do
  pending # Write code here that turns the phrase above into concrete actions
end 