Feature: Cart
  Background:
    Given There are multiple products
    And I am on the product show page

  Scenario: Product can be added to cart
    When I click 'Add to Cart'
    Then I see 'Cart (1)'

  Scenario: Multiple of the same product can be added to cart
    When I click 'Add to Cart'
    And I click 'Add to Cart'
    Then I see 'Cart (2)'

  Scenario: Cart can be viewed
    Given there are items in my cart
    When I click 'Cart (1)'
    Then I see the items listed

  Scenario: Item quantity is visible
    Given there are items in my cart
    When I click 'Cart (1)'
    Then I see 'Quantity: 1'

  Scenario: Remove item from cart
    Given there are items in my cart
    When I click 'Cart (1)'
    And I click 'Remove from Cart'
    Then I see 'Your cart is empty'