Feature: delete blood pressure record 

	Background:
		Given I have not any pressure records		
		Given I am logged in with name "juancito"
  
  Scenario: having one blood pressure record
    When I add a blood pressure record with id "209" and name "juancito"
    When I visit "/the history page"
    When I follow "delete_209" 
    Then I should see "You have not pressure records"

  Scenario: I still see the records that have not been deleted
    When I add a blood pressure record with id "209" and name "juancito"
    When I add a blood pressure record with id "210" and name "juancito"
    When I visit "/the history page"
    When I follow "delete_209" 
    Then I should see "210"
    
 Scenario: I should not see the deleted record
    When I add a blood pressure record with id "209" and name "juancito"
    When I add a blood pressure record with id "210" and name "juancito"
    When I visit "/the history page"
    When I follow "delete_209" 
    Then I should not see "209"
