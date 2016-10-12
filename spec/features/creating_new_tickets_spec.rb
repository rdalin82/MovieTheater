require 'rails_helper'

describe "creating new movies" do 
  before do 
    Auditorium.create(name: "test", capacity: 20) 
  end

  it "makes a new movie" do 
    visit "auditoriums/1/movies/new"
    within("#new_movie") do 
      fill_in "movie_movie_name", with: "Test Movie" 
      fill_in "movie_showtime", with: "2016, 12, 1, 10, 00"
      fill_in "movie_length", with: "120"
    end
    click_button "Submit" 
    expect(page).to have_content("successfully")

  end
end
