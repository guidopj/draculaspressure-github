Feature: delete blood pressure record 

	Background:
		Given i do not have any pressure records		
		Given I am logged in with name "juancito"
  
  Scenario: having one blood pressure record
    When I add a blood pressure record
    When I visit "/the history page"
    When I press "delete_button"
    Then I should see "no blood pressure records"

  Scenario: having three blood pressure records
    Given I have 3 blood pressure records
    When I visit "/the history page"
    When I delete the second record
    Then I should not see the second record
  
