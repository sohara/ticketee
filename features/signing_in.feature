Feature: Signing in
  In order to use the site
  As a user
  I want to be able to log in
	
	Background: 
		Given there is an unconfirmed user with the email address "user@ticketee.com" and password "password"
		
  Scenario: Signing in via confirmation
    And "user@ticketee.com" opens the email with subject "Confirmation instructions"
    And they click the first link in the email
    Then I should see "Your account was successfully confirmed"
    Then I should see "Signed in as user@ticketee.com"

 