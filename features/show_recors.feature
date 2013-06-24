Feature: Show record
	As a User
	I want to see info of my pressure records

	Background:
		Given i do not have any pressure records		
		Given I am logged in with name "juancito"
    
  Scenario: See date
    Given I have a blood pressure record with min "8" and max "12" and date "2013-06-22T13:00:00-03:00" with name "juancito"
		When I visit "/the history page"
    Then I should see "2013-06-22"
    
  Scenario: See time
    Given I have a blood pressure record with min "8" and max "12" and date "2013-06-22T13:00:00-03:00" with name "juancito"
		When I visit "/the history page"
    Then I should see "13:00"