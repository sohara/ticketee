Feature: Creating projects 
	In order to have projects to assign tickets to 
	As a user 
	I want to create them easily

	Background: 
		Given there is an admin with the email address "admin@ticketee.com" and password "password" 
		And I am signed in as them
		Given I am on the homepage 
		When I follow "New Project"

	Scenario: Creating a project 
		And I fill in "Name" with "TextMate 2"
		And I press "Create Project"
		Then I should see "Project has been created."
		And I should be on the project page for "TextMate 2"
		And I should see "TextMate 2 - Projects - Ticketee"
		
	Scenario: Creating a project without a name 
		And I press "Create" 
		Then I should see "Project has not been created." 
		Then I should see "Name can't be blank"	