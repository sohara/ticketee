Feature: Hidden Links 
	In order to clean up the user experience 
	As the system 
	I want to hide links from users who can't act on them

	Background: 
		Given there is a user with the email address "user@ticketee.com" and password "password"
		Given there is an admin with the email address "admin@ticketee.com" and password "password"  
		And there is a project called "TextMate 2"
	
	Scenario: New project link is hidden for non-signed-in users
		Given I am on the homepage 
		Then I should not see the "New Project" link
		
	Scenario: New project link is hidden for signed-in users
		Given I am signed in as "user@ticketee.com"
		Then I should not see the "New Project" link
	
	Scenario: New project link is shown to admins
		Given I am signed in as "admin@ticketee.com"
		Then I should see the "New Project" link
		
	Scenario: Edit project link is hidden for non-signed-in users
		Given I am on the homepage
		When I follow "TextMate 2" 
		Then I should not see the "Edit" link
	
	Scenario: Edit project link is hidden for signed-in users 
		Given I am signed in as "user@ticketee.com"
		When I follow "TextMate 2"
		Then I should not see the "Edit" link
		
	Scenario: Edit project link is shown to admins
		Given I am signed in as "admin@ticketee.com"
		When I follow "TextMate 2"
		Then I should see the "Edit" link
		
	Scenario: Delete project link is hidden for non-signed-in users
		Given I am on the homepage
		When I follow "TextMate 2"
		Then I should not see the "Delete" link
		
	Scenario: Delete project link is hidden for signed-in users
		Given I am signed in as "user@ticketee.com"
		When I follow "TextMate 2"
		Then I should not see the "Delete" link
		
	Scenario: Delete project link is shown to admins
		Given I am signed in as "admin@ticketee.com"
		When I follow "TextMate 2"
		Then I should see the "Delete" link