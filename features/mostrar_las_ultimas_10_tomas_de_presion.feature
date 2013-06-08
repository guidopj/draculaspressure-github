@wip
Feature: See my last ten records arterial blood pressure
  As a User
  I want see my last ten records arterial blood pressure
  
  Background: testing
    Given i am at "blood_pressure_records" page
   
  Scenario: begining my pressure record table
    Given i do not have any pressure records
    When i am on the "blood_pressure_records"
    Then i should not see any blood pressures record

  Scenario: my pressure record table has ten rows
    Given i have 10 pressure records
    Then i should see 10 blood pressures records

  Scenario: my pressure record table has ten rows and i add one more
    Given i have 10 pressure records
    And my first record has id 1
    When i add one more
    And when i am on the "blood_pressure_records"
    Then i should see 10 blood pressures records
    And i should not see id "1"
