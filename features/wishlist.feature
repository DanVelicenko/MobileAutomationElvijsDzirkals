Feature: Wishlist

  @run
  Scenario: Verify that wishlist items are added in the right order
    When I register a new account and login
    And I open foundation section
    #And I add visible items to wish list
    And I go to my wish list
    And I can see items added in the same order as before