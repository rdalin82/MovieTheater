require 'rails_helper'

describe "creating new movies" do 
  before do 
    Auditorium.create(name: "test", capacity: 20) 
    visit "/" 
    click_link "Auditoriums"
    click_link "View Movies" 
    click_link "Create a new movie"
  end

  it "makes a new movie" do 

    within("#new_movie") do 
      fill_in "movie_movie_name", with: "Test Movie" 
      fill_in "movie_showtime", with: "2016, 12, 1, 10, 00"
      fill_in "movie_length", with: "120"
    end
    click_button "Submit" 
    expect(page).to have_content("successfully")

  end
end
