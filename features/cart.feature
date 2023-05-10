Feature: Cart
  Background:
    Given There are multiple products

  Scenario: Product can be added to cart
    Given I am on the product show page
    When I click 'Add to Cart'
    Then I see cart count increase