Feature: Products Index
  Background:
    Given There are multiple products

  Scenario: Products are visible
    Given I am on the products index page
    Then I see the product listed

  Scenario: Viewing individual product
    Given I am on the product show page
    Then I see the product details