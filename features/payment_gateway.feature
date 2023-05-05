Feature: Payment Gateway
  Background:
    Given There are multiple products

  Scenario: Checkout redirects to success
    Given I am on the product show page
    When I click 'Buy Me!'
    Then I am redirected to the payment complete page

  Scenario: Checkout shows order number
    Given I am on the product show page
    When I click 'Buy Me!'
    Then I see my order number

  Scenario: Checkout stores creates purchases association table
    Given I am on the product show page
    When I click 'Buy Me!'
    Then A new purchase is created