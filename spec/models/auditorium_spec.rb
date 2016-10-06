require 'rails_helper'

RSpec.describe Theater, type: :model do
  let (:blankauditorium) { Auditorium.new }
  let (:nameonly) { Auditorium.new(name: "Theater one")}
  let (:capacityonly) { Auditorium.new(capacity: 80) }
  let (:defaultTheater) { Theater.new(name: "Default") }
  let (:validtauditorium) { Auditorium.new(name: "Theater one", capacity: 80, theater: defaultTheater) }
  describe "create new auditorium" do 
    it "should not create a blank auditorium" do 
      expect(blankauditorium.save).to be(false) 
    end
    it "should not create with name only" do 
      expect(nameonly.save).to be(false) 
    end
    it "should not create with capacity only" do 
      expect(capacityonly.save).to be(false)
    end
    it "should create valid auditorium" do 
      expect(validtauditorium.save).to be(true) 
    end
  end
end
