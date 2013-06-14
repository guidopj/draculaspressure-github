
Feature: average of blood pressures in a range of date 

	Background:
		Given i do not have any pressure records		
		Given I am logged in with name "juancito"
   
  Scenario:  No records yet
		When I visit "/blood pressures average page"
		When I fill in "minDate" with "2010-01-01"
		When I fill in "maxDate" with "2020-01-01"		
		When I press "buttonCalculate"
		Then I should see "No such records in the specified range of dates"

	Scenario:  Average five records in a day
		Given I have a blood pressure record with min "8" and max "12" and date "2015-01-01" with name "juancito"
		Given I have a blood pressure record with min "8" and max "12" and date "2015-01-01" with name "juancito"
		Given I have a blood pressure record with min "8" and max "12" and date "2015-01-01" with name "juancito"
		Given I have a blood pressure record with min "8" and max "12" and date "2015-01-01" with name "juancito"
		Given I have a blood pressure record with min "10" and max "12" and date "2015-01-01" with name "pepe"
		When I visit "/blood pressures average page"
		When I fill in "minDate" with "2015-01-01"
		When I fill in "maxDate" with "2015-01-01"
		When I press "buttonCalculate"
		Then I should see "8"
		Then I should see "12"

	Scenario:  Average five records in a range of dates
		Given I have a blood pressure record with min "7" and max "13" and date "2010-01-01" with name "juancito"
		Given I have a blood pressure record with min "7" and max "13" and date "2011-02-03" with name "juancito"
		Given I have a blood pressure record with min "7" and max "13" and date "2014-08-02" with name "juancito"
		Given I have a blood pressure record with min "8" and max "120" and date "2020-03-10" with name "juancito"
		Given I have a blood pressure record with min "8" and max "12" and date "2100-07-07" with name "juancito"
		When I visit "/blood pressures average page"	
		When I fill in "minDate" with "2010-01-01"
		When I fill in "maxDate" with "2020-01-01"
		When I press "buttonCalculate"
		Then I should see "7"
		Then I should see "13"



	Scenario:  there is no records in a range of date
		Given I have a blood pressure record with min "7" and max "13" and date "2010-01-01" with name "juancito"
		Given I have a blood pressure record with min "7" and max "13" and date "2011-02-03" with name "juancito"
		Given I have a blood pressure record with min "7" and max "13" and date "2014-08-02" with name "juancito"
		Given I have a blood pressure record with min "8" and max "12" and date "2020-03-10" with name "juancito"
		Given I have a blood pressure record with min "8" and max "12" and date "2100-07-07" with name "juancito"
		When I visit "/blood pressures average page"	
		When I fill in "minDate" with "2005-01-01"
		When I fill in "maxDate" with "2009-01-01"
		When I press "buttonCalculate"
		Then I should see "No such records in the specified range of dates"


