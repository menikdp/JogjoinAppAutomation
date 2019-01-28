@Register
Feature: Register
  On the Jogjoin app, users can register as merchants or sellers. Merchant is the supplier of goods that will send the ordered goods to the seller's consumer, while the seller is ordering the goods for the consumer without having to think about stock and packing.

  Background: 
    Given Launch the app
    Then user swipe screen twice
    When user tap on mulai button 
    Then user tap on disini

  Scenario: Successfully register as merchant
    Given user choose register as Merchant
    When user tap on Lanjut button as merchant
    Then user fill all merchant data correctly
    When user tap on Lanjut in merchant form
    Then should successfully registered as Merchant

  Scenario: Successfully register as seller
    Given user choose register as Seller
    When user tap on Lanjut button as seller
    Then user fill all seller data correctly
    When user tap on lanjut button in seller form
    Then user should successfully registered as Seller

  # Scenario: Register as seller with blank data
  #   Given user choose register as Seller
  #   When user tap on Lanjut button as seller
  #   Then user do not fill all seller data 
	#   When user tap on Lanjut button in seller form
  #   Then user should see error message