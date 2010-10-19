Given /^there is an? (admin|user) with the email address "([^"]*)" and password "([^"]*)"$/ do |admin,email, password|
  @user = User.create!(:email => email, :password => password, :password_confirmation => password)
  @user.admin = admin == "admin"
  @user.save!
end

Given /^"([^"]*)" has confirmed their account$/ do |email|
  User.find_by_email(email).confirm!
end

Given /^I am signed in as "([^"]*)"$/ do |email|
  @user = User.find_by_email!(email)
  steps("Given I am signed in as them")
end



Given /^I am signed in as them$/ do
  steps(%Q{
    Given I am on the homepage
    When I follow "Sign in"
    And I fill in "Email" with "#{@user.email}"
    And I fill in "Password" with "password"
    And I press "Sign in"
    Then I should see "Signed in successfully."
  })
end

