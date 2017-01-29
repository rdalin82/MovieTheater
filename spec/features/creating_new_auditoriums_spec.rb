require 'rails_helper'


describe "creating new auditoriums" do
  before do 
    visit "/" 
    click_link "Auditoriums"
  end
  it "goes to new Auditorium" do 
    visit "auditoriums"
    click_link "Create a new Auditorium"
    expect(page).to have_content("New Auditorium")
  end

  it "makes a new auditorium" do 
    visit "auditoriums/new"
    within("#new_auditorium") do 
      fill_in "auditorium_name", with: "Test Auditorium Foo" 
      fill_in "auditorium_capacity", with: "1000"
    end
    click_button "Submit" 
    expect(page).to have_content("Test Auditorium Foo")
  end
end
