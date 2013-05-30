Feature: Registrar presion min y max
	As a User
  I want to record my min and max arterial blood pressure

	Scenario: Happy path
  	Given I am on "the new record page"
    And I fill in "record[min]" with "80"
    And I fill in "record[max]" with "120"
    When I press "saveButton"
    Then I should see "Your record has been successfully completed"

  Scenario: Min is not valid
    Given I am on "the new record page"
    And I fill in "record[min]" with "asd"
    And I fill in "record[max]" with "120"
    When I press "saveButton"
    Then I should see "The Min Value is not valid"

  Scenario: Max is not valid
    Given I am on "the new record page"
    And I fill in "record[min]" with "80"
    And I fill in "record[max]" with "-20"
    When I press "saveButton"
    Then I should see "The Max Value is not valid"

  Scenario: Max nad Min are not valid
    Given I am on "the new record page"
    And I fill in "record[min]" with "-20"
    And I fill in "record[max]" with "SAJHSAJHasdd"
    When I press "saveButton"
    Then I should see "The Min and Max values are not valid"

  Scenario: Min is not filled
    Given I am on "the new record page"
    And I fill in "record[min]" with ""
    And I fill in "record[max]" with "110"
    When I press "saveButton"
    Then I should see "The Min value was not filled"

  Scenario: Max is not filled
    Given I am on "the new record page"
    And I fill in "record[min]" with "60"
    And I fill in "record[max]" with ""
    When I press "saveButton"
    Then I should see "The Max value was not filled"

  Scenario: Max and Min are not filled
    Given I am on "the new record page"
    And I fill in "record[min]" with ""
    And I fill in "record[max]" with ""
    When I press "saveButton"
    Then I should see "The Min and Max values were not filled"


  Scenario: Max is not filled and Min is not valid
    Given I am on "the new record page"
    And I fill in "record[min]" with "asd"
    And I fill in "record[max]" with ""
    When I press "saveButton"
    Then I should see "The Max value was not filled"
		Then I should see "The Min value is not valid"

  Scenario: Max is not valid and Min is not filled
    Given I am on "the new record page"
    And I fill in "record[min]" with ""
    And I fill in "record[max]" with "asdhheggHHHHhfs"
    When I press "saveButton"
    Then I should see "The Max value is not valid"
		Then I should see "The Min value was not filled"



