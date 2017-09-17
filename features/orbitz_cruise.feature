Feature: Cruise Search Functionality

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