Feature: home behaviour
	As a User
	I want to see a log in button in the home page
    
  Scenario: See Log in button
    Given I am not log in
		When I visit "/the home page"
    Then I should see "Log in"
    
  Scenario: See arterial blood pressure in button
    Given I am logged in with name "juancito"
		When I visit "/the home page"
    Then I should see "Arterial Blood Pressures"