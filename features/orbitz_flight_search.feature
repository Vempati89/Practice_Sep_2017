Feature: Flight Search Functionality

  Background:
    Given user is on Orbitz home page
    And user selects round trip button under flights tab


  #Imperative
  Scenario: verify the user gets the list of flights available for the dates specified
    When user enter columbus in flying from edit box and selects Columbus, OH option
    When user enter cleveland in flying to edit box and selects Cleveland, OH option
    And user enters future date in Departing edit box
    And user enters future date in Arrival edit box
    And click on search button
    Then verify flight serach results page is displayed
    And verify the list of airports should match the dates specified


  Scenario Outline: verify the user gets the list of airport that matches the city name
    When user enter <city_name> in flying from edit box
    Then verify the list of airports matching the <airport_name> should be displayed

    Examples:
      | city_name | airport_name |
      | columbus  | cmh          |
      | chicago   | ord          |
      | cleveland | cle          |


  Scenario: verify the list of airports displayed should not be more than 5
    When user enter "chicago" in flying from edit box
    Then verify the list of airports count is more than 5



Declarative
  Scenario: verify the user gets the list of flights available for the dates specified
    When user searches for a valid airports for the future date
    And verify the list of airports should match the dates specified



  Scenario: verify the user is warned when searching for past date flights
    When user enter "columbus" in flying from edit box and selects "Columbus (CMH-All Airports)" option
    When user enter "cleveland" in flying to edit box and selects "Cleveland (CLE-All Airports)" option
    And user enters "8/25/2017" in Departing edit box
    And user enters "8/15/2017" in Arrival edit box
    And click on search button
    Then user should see the following message
      | Departing date is in the past. Please enter a valid departing date. |

