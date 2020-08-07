Feature: Registration

  Scenario: Registering with random credentials
    When I click on the overflow menu
    And I tap on log in button
    And I choose to register a new account
    And I input new user credentials in registration form
    And I submit the details for registration
    Then I can login with those details
    When I click on the overflow menu
    And I go to My profile section
    Then My profile section shows my email
    And My profile section shows my full name

    Scenario: Logging in with existing credentials
      When I click on the overflow menu
      And I tap on log in button
      And I input existing user details
      And I tap on log in at registration screen
      Then My profile section shows existing users email
      And My profile section shows existing users name