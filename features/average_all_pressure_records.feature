Feature: average of all blood pressures

	Background:
		Given i do not have any pressure records		
		Given I am logged in with name "juancito"

 Scenario:  Average of no records
		When I visit "/blood pressures average page"	
		When I press "buttonCalculate"
		Then I should see "0"

	Scenario:  Average of four records
		Given I have a blood pressure record with min "8" and max "12" with name "juancito"
		Given I have a blood pressure record with min "8" and max "13" with name "juancito"
		Given I have a blood pressure record with min "9" and max "12" with name "juancito"
		Given I have a blood pressure record with min "10" and max "12" with name "juancito"
		Given I have a blood pressure record with min "10" and max "12" with name "pepe"
		When I visit "/blood pressures average page"
		When I press "buttonCalculate"
		Then I should see "8.75"
		Then I should see "12.25"
