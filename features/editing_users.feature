Feature: Editing a user
   In order to change a user's details
   As an admin
   I want to be able to modify them through the backend

 Background:
   Given there is an admin with the email address "admin@ticketee.com" and password "password"
   And I am signed in as them

   And there is a user with the email address "user@ticketee.com" and password "password"
   Given I am on the homepage
   When I follow "Admin"
   And I follow "Users"
   And I follow "user@ticketee.com"
   And I follow "Edit"

 Scenario: Updating a user's details
   When I fill in "Email" with "newguy@ticketee.com"
   And I press "Update User"
   Then I should see "User has been updated."
   And I should see "newguy@ticketee.com"
   And I should not see "user@ticketee.com"

  Scenario: Toggling a user's admin ability
    When I check "Is an admin?"
    And I press "Update User"
    Then I should see "User has been updated."
    And I should see "user@ticketee.com (Admin)"


 Scenario: Updating with an invalid email fails
   When I fill in "Email" with "fakefakefake"
   And I press "Update User"
   Then I should see "User could not be updated."
   And I should see "Email is invalid"