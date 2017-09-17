class OrbitzHomePage
  include PageObject

  page_url 'www.orbitz.com'

  link(:select_flight_tab, :id=> 'tab-flight-tab')
  label(:select_roundtrip, :id=> 'flight-type-roundtrip-label')
  text_field(:dep_airport, id: 'flight-origin')
  text_field(:arr_airport, id: 'flight-destination')
  ul(:all_airports, :class => 'results')

  text_field(:dep_date, id: 'flight-departing')
  text_field(:arr_date, id: 'flight-returning')
  button(:search, :id=> 'search-button')


  def select_dep_airport city_name, airport_name
    self.dep_airport = city_name
    select_airport airport_name
  end

  def select_arr_airport city_name, airport_name
    self.arr_airport = city_name
    select_airport airport_name
  end

  def select_future_dep_date
    self.dep_date_element.value = change_date 2




  end

  def select_future_arr_date
    self.arr_date = change_date 2
  end

  def select_airport airport_name
    all_airports_element.wait_until_present(60).lis.each do |each_airport|
      p each_airport.text
      if each_airport.text.include? airport_name
        each_airport.click
        break
      end
    end
  end


  def change_date(no_of_days)
    (Time.now+60*60*24*no_of_days).strftime('%m/%d/%Y')
  end

end