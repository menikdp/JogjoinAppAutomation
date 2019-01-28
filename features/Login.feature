@Login
Feature: Login

  Background: 
    Given Launch the app
    Then user swipe screen twice
    When user tap on mulai button

  Scenario: Successfully login 
    Given user fill login data correctly
    When user tap on Masuk button
    Then user should login Successfully

  # Scenario: Login with blank data
  #   Given user did not fill any data on login form
  #   When user tap on Masuk button
  #   Then user see error message

  # Scenario: Login with mismatch between email and password
  #   Given user fill login with mismatch data
  #   When user tap on Masuk button
  #   Then user should see error message

  # Scenario: Login with empty email but valid password
  #   Given user did not fill email
  #   But user fill a valid password
  #   When user tap on Masuk button
  #   Then user should see error message

  # Scenario: Login with no internet
  #   Given user fill login data correctly
  #   But phone not connect to internet
  #   When user tap on Masuk button
  #   Then user should see error message there is no internet connection

