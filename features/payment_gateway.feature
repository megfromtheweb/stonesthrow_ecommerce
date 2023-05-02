Feature: Payment Gateway
  Background:
    Given There are multiple products

  Scenario: Checkout
    Given I am on the product show page
    When I click 'Buy Me!'
    Then I am redirected to the payment complete page
  
  Scenario: Checkout gives order number
    Given I am on the product show page
    When I click 'Buy Me!'
    Then A new order is created