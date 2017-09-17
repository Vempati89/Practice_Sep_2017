Given(/^user is on Orbitz home page$/) do
  visit OrbitzHomePage
end

And(/^user selects round trip button under flights tab$/) do
  on(OrbitzHomePage).select_flight_tab
  on(OrbitzHomePage).select_roundtrip
end

When(/^user enter (.*) in flying from edit box and selects (.*) option$/) do |city_name, airport_name|
  on(OrbitzHomePage).select_dep_airport city_name, airport_name
end


When(/^user enter (.*) in flying to edit box and selects (.*) option$/) do |city_name, airport_name|
  on(OrbitzHomePage).select_arr_airport city_name, airport_name
end

And(/^user enters future date in Departing edit box$/) do
  on(OrbitzHomePage).select_future_dep_date
end

And(/^user enters future date in Arrival edit box$/) do
  on(OrbitzHomePage).select_future_arr_date
end

And(/^click on search button$/) do
  on(OrbitzHomePage).search_element.click
end

Then(/^verify flight serach results page is displayed$/) do
  on(OrbitzFlightSearchResultsPage).verify_search_results_are_displayed
end