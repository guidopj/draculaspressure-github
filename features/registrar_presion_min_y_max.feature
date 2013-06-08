@wip
Feature: Registrar presion min y max
	As a User
	I want to record my min and max arterial blood pressure

	Background:
		And I am logged in

	Scenario: Happy path
		Given I am on "the new record page"
		When I fill in "blood_pressure[min]" with "80"
		When I fill in "blood_pressure[max]" with "120"
		When I press "Save"
		Then I should see "Your record has been successfully completed"

	Scenario: Min is not valid
		Given I am on "the new record page"
		When I fill in "blood_pressure[min]" with "asd"
		When I fill in "blood_pressure[max]" with "120"
		When I press "Save"
		Then I should see "The Min Value is not valid"

	Scenario: Max is not valid
		Given I am on "the new record page"
		When I fill in "blood_pressure[min]" with "80"
		When I fill in "blood_pressure[max]" with ""
		When I press "Save"
		Then I should see "The Max Value is not valid"
