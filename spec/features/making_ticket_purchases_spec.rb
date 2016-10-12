require 'rails_helper'

describe "making purchases" do 
  before do 
    Timecop.freeze(Time.new(2015, 10, 5))
    Auditorium.create(name: "test", capacity: 20).movies.create(
      movie_name: "Test movie", showtime: DateTime.new(2016, 11, 1, 10, 10), length: 120) 
  end
  after do 
    Timecop.return
  end

  it "purchases a movie ticket" do 
    visit "purchase/movies/1/tickets/new"
    within("#new_user") do 
      fill_in "user_name", with: "Jenny Smith" 
      fill_in "user_email", with: "js@gmail.com"
      fill_in "creditcard_number", with: "4444555566667777"
      select "2 - February", from: "card_month" 
      select "2018", from: "card_year" 
    end
    
    click_button "Purchase" 
    expect(page).to have_content("successful")
  end
end
