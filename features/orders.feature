Feature: Cart
  Background:
    Given There are multiple products
    And There are paid orders
  
  Scenario: There is an orders index
    Given I am on the orders page
    Then I see "Order #"

  Scenario: Only paid orders are visible
    Given There are unpaid orders
    And I am on the orders page
    Then There is only the number of paid orders visible
