require 'rails_helper'

RSpec.describe Auditorium, type: :model do
  let (:blankauditorium) { Auditorium.new }
  let (:nameonly) { Auditorium.new(name: "Auditorium one")}
  let (:capacityonly) { Auditorium.new(capacity: 80) }
  let (:validtauditorium) { Auditorium.new(name: "Auditorium One", capacity: 80) }
  describe "#save" do 
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
    it "should not create duplicates" do 
      duplicate = Auditorium.new(name: "Auditorium One", capacity: 100)
      expect(duplicate.save && validtauditorium.save).to eq(false) 
    end
  end
end
