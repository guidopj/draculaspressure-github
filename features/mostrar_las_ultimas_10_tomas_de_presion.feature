Feature: See my last ten records arterial blood pressure
  As a User
  I want see my last ten records arterial blood pressure
  
  Scenario: recording my pressure within the parameters
    Given i have a max of "12" 
    And i have a min of "8"
    When i am on the "pressure records page"
    Then i should see "12" in the max field of the table
    And i should see "8" in the min field of the table
    And i should see "Your pressure is normal"

  Scenario: recording my pressure outside the parameters
    Given i have a max of "14" 
    And i have a min of "10"
    When i am on the "pressure records page"
    Then i should see "14" in the max field of the table
    And i should see "10" in the min field of the table
    And i should see "Your pressure is NOT normal"
   
  Scenario: begining my pressure record table
    Given i do not have any pressure records
    When i am on the "pressure records page"
    Then page.should have_css("table#pressureRecordsTable tr", :count=>0)

  Scenario: my pressure record table has ten rows
    Given i have "10" pressure records
    When i am on the "pressure records page"
    Then page.should have_css("table#pressureRecordsTable tr", :count=>10)

  Scenario: my pressure record table has ten rows and i add one more
    Given i have "10" pressure records
    When i add one more
    And when i am on the "pressure records page"
    Then page.should have_css("table#pressureRecordsTable tr", :count=>11)
    And i should not see id "1"
