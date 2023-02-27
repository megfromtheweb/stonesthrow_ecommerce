Feature: Products Index
  Background:
    Given I am on the products index page

  Scenario: Products are visible
    Given There is a product
    Then I see the product listed