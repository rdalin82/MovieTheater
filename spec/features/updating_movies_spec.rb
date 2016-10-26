require 'rails_helper'

describe "creating new movies" do 
  before do 
    auditorium = Auditorium.create(name: "test", capacity: 20) 
    auditorium.movies.create!(movie_name: "Test Movie", showtime: "2016, 12, 1, 10, 00", length: 120)
  end

  it "editing a movie" do 
    visit "auditoriums/1/movies/1/edit" 
    within(".input-group") do 
      fill_in "movie_movie_name", with: "Test Movie1" 
      fill_in "movie_showtime", with: "2016, 12, 1, 10, 00"
      fill_in "movie_length", with: "120"
    end
    click_button "Submit" 
    expect(page).to have_content("successfully")
  end
end
