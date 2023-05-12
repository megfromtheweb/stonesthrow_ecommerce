Feature: Cart
  Background:
    Given There are multiple products

  Scenario: Product can be added to cart
    Given I am on the product show page
    When I click 'Add to Cart'
    Then I see cart count increase

  Scenario: Cart can be viewed
    Given I am on the product show page
    And there are items in my cart
    When I click 'Cart (1)'
    Then I see the items listed