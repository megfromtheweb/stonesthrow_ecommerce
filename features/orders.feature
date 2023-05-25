Feature: Cart
  Background:
    Given There are multiple products
    And There are paid orders
    And I am on the home page
  
  Scenario: There is an orders index
    When I click "Orders"
    Then I see "Order Number #"

  Scenario: Only paid orders are visible
    Given There are unpaid orders
    When I click "Orders"
    Then There is only the number of paid orders visible
