@wip
Feature: average of blood pressures in a range of date 

	Background:
		Given I am logged in
   
  Scenario:  No records yet
		Given I am on "blood pressures average page"
		When I press "buttonCalculate"
		Then I should see  "WithoutElementsException"


	Scenario:  Average five records in a day
		Given I have a blood pressure record with min "80" and max "120" and date "2015-1-1"
		Given I have a blood pressure record with min "80" and max "120" and date "2015-1-1"
		Given I have a blood pressure record with min "80" and max "120" and date "2015-1-1"
		Given I have a blood pressure record with min "80" and max "120" and date "2015-1-1"
		Given I have a blood pressure record with min "80" and max "120" and date "2015-1-1"
		Given I am on "blood pressures average page"
		When I fill in "minDate" with "2015-1-1"
		When I fill in "maxDate" with "2015-1-1"
		When I press "buttonCalculate"
		Then I should see "Min: 80"
		Then I should see "Max: 120"

	Scenario:  Average five records in a range of dates
		Given I have a blood pressure record with min "70" and max "113" and date "2010-1-1"
		Given I have a blood pressure record with min "70" and max "113" and date "2011-2-3"
		Given I have a blood pressure record with min "70" and max "113" and date "2014-8-2"
		Given I have a blood pressure record with min "80" and max "120" and date "2020-3-10"
		Given I have a blood pressure record with min "80" and max "120" and date "2100-7-7"
		Given I am on "blood pressures average page"
		When I fill in "minDate" with "2010-1-1"
		When I fill in "maxDate" with "2020-1-1"
		When I press "buttonCalculate"
		Then I should see "Min: 70"
		Then I should see "Max: 113"



	Scenario:  there is no records in a range of date
		Given I have a blood pressure record with min "70" and max "113" and date "2010-1-1"
		Given I have a blood pressure record with min "70" and max "113" and date "2011-2-3"
		Given I have a blood pressure record with min "70" and max "113" and date "2014-8-2"
		Given I have a blood pressure record with min "80" and max "120" and date "2020-3-10"
		Given I have a blood pressure record with min "80" and max "120" and date "2100-7-7"
		Given I am on "blood pressures average page"
		When I fill in "minDate" with "2005-1-1"
		When I fill in "maxDate" with "2009-1-1"
		When I press "buttonCalculate"
		Then I should see "WithoutElementsException"


