Feature: Viewing projects 
	In order to assign tickets to a project 
	As a user 
	I want to be able to see a list of available projects

	Background:
		Given there is a user with the email address "user@ticketee.com" and password "password"
		And I am signed in as them
		And there is a project called "TextMate 2"
		And "user@ticketee.com" can view the "TextMate 2" project
		And there is a project called "Internet Explorer"
		
	Scenario: Listing all projects  
		Given I am on the homepage 
		Then I should not see "Internet Explorer"
		When I follow "TextMate 2" 
		Then I should be on the project page for "TextMate 2"