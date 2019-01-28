@Purchase
Feature: Purchase
  
  Background: 
    Given Launch the app
    Then user swipe screen twice
    Then user tap on mulai button
    And user tap on lewati
    When user choose a product
    Then user should see product detail

  Scenario: Successfully purchase
    Given user tap on beli
    Then user should fill customer data
    When user tap on lanjut pembayaran
    Then user should see transaction detail
    When user tap Selesai button
    Then user should see popup
    Then user tap OK

  # Scenario: Purchase with empty recipient's data
  #   Given user tap on beli
  #   Then user did not fill any data
  #   When user tap on lanjut pembayaran
  #   Then user should see error message
  #   And user still on purchase form
    