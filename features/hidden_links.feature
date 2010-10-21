Feature: Hidden Links 
	In order to clean up the user experience 
	As the system 
	I want to hide links from users who can't act on them

	Background: 
		Given there is a user with the email address "user@ticketee.com" and password "password"
		Given there is an admin with the email address "admin@ticketee.com" and password "password"  
		And there is a project called "TextMate 2"
		And "user@ticketee.com" has created a ticket for this project:
		 | title  | description       |
		 | Shiny! | My eyes! My eyes! |
		And "user@ticketee.com" can view the "TextMate 2" project
		
	Scenario: New project link is hidden for signed-in users
		Given I am signed in as "user@ticketee.com"
		Then I should not see the "New Project" link
	
	Scenario: New project link is shown to admins
		Given I am signed in as "admin@ticketee.com"
		Then I should see the "New Project" link
	
	Scenario: Edit project link is hidden for signed-in users 
		Given I am signed in as "user@ticketee.com"
		When I follow "TextMate 2"
		Then I should not see the "Edit" link
		
	Scenario: Edit project link is shown to admins
		Given I am signed in as "admin@ticketee.com"
		When I follow "TextMate 2"
		Then I should see the "Edit" link
		
	Scenario: Delete project link is hidden for signed-in users
		Given I am signed in as "user@ticketee.com"
		When I follow "TextMate 2"
		Then I should not see the "Delete" link
		
	Scenario: Delete project link is shown to admins
		Given I am signed in as "admin@ticketee.com"
		When I follow "TextMate 2"
		Then I should see the "Delete" link
		
		Scenario: New ticket link is shown to a user with permission
			Given "user@ticketee.com" can view the "TextMate 2" project
			And "user@ticketee.com" can create tickets in the "TextMate 2" project
			And I am signed in as "user@ticketee.com"
			When I follow "TextMate 2"
			Then I should see "New Ticket"
			
		Scenario: New ticket link is hidden from a user without permission
			Given "user@ticketee.com" can view the "TextMate 2" project
			And I am signed in as "user@ticketee.com"
			When I follow "TextMate 2"
			Then I should not see "New Ticket"
			
		Scenario: New ticket link is shown to admins
			Given I am signed in as "admin@ticketee.com"
			When I follow "TextMate 2"
			Then I should see "New Ticket"

		Scenario: Edit ticket link is shown to a user with permission 
			Given "user@ticketee.com" can view the "TextMate 2" project
			And "user@ticketee.com" can edit tickets in the "TextMate 2" project
			And I am signed in as "user@ticketee.com"
			When I follow "TextMate 2"
			And I follow "Shiny!"
			Then I should see "Edit"
			
		Scenario: Edit ticket link is hidden from a user without permission
			Given "user@ticketee.com" can view the "TextMate 2" project
			And I am signed in as "user@ticketee.com"
			When I follow "TextMate 2"
			And I follow "Shiny!"
			Then I should not see "Edit"
			
		Scenario: Edit ticket link is shown to admins
			Given I am signed in as "admin@ticketee.com"
			When I follow "TextMate 2"
			And I follow "Shiny!"
			Then I should see "Edit"
		
		Scenario: Delete ticket link is shown to a user with permission
			Given "user@ticketee.com" can view the "TextMate 2" project
			And "user@ticketee.com" can delete tickets from the "TextMate 2" project
			And I am signed in as "user@ticketee.com"
			When I follow "TextMate 2"
			And I follow "Shiny!"
			Then I should see "Delete"
			
		Scenario: Delete ticket link is hidden from a user without permission
			Given "user@ticketee.com" can view the "TextMate 2" project
			And I am signed in as "user@ticketee.com"
			When I follow "TextMate 2"
			And I follow "Shiny!"
			Then I should not see "Delete"
			
		Scenario: Delete thicket link is shown to admins
			Given I am signed in as "admin@ticketee.com"
			When I follow "TextMate 2"
			And I follow "Shiny!"
			Then I should see "Delete"