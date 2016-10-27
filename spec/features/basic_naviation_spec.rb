require 'rails_helper'

describe "basic navigation" do 
  before do 
    visit "/" 
  end

  it "should have a movies link" do 
    click_link "Movies" 
    expect(page).to have_content("Movies")
  end
  it "should have a auditorium link" do 
    click_link "Auditoriums" 
    expect(page).to have_content("Create a new Auditorium")
  end

  it "should have a ticket link" do 
    click_link "Tickets" 
    expect(page).to have_content("Tickets")
  end
end
