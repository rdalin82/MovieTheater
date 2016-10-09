require 'rails_helper'

RSpec.describe Creditcard, type: :model do
  before do 
      Timecop.freeze(DateTime.new(2016, 10, 5, 13, 00))
    end
  after do 
    Timecop.return
  end
  let (:blankcard) { Creditcard.new }
  let (:card3) { Creditcard.new(number:"3444555566667777", expiration_date: DateTime.new(2018, 10)) }
  let (:card4) { Creditcard.new(number:"4444555566667777", expiration_date: DateTime.new(2018, 10)) }
  let (:card5) { Creditcard.new(number:"5444555566667777", expiration_date: DateTime.new(2018, 10)) }
  let (:card6) { Creditcard.new(number:"6444555566667777", expiration_date: DateTime.new(2018, 10)) }
  let (:letterscard) { Creditcard.new(number: "abceabceabceabce", expiration_date: DateTime.new(2018, 10)) } 
  let (:fakecard) { Creditcard.new(number: "444555566667777", expiration_date: DateTime.new(2018, 10)) } 
  let (:oldcard) { Creditcard.new(number: "4444555566667777", expiration_date: DateTime.new(2016, 9)) }
  describe "#save" do 
    it "should not save a blank card" do 
      expect(blankcard.save).to be(false) 
    end
    it "should save a valid card" do 
      expect(card3.save).to be(true)
      expect(card3.valid?).to be(true)
      expect(card4.save).to be(true)
      expect(card5.save).to be(true) 
      expect(card6.save).to be(true)
    end
    it "should not save a fake card" do 
      expect(fakecard.save).to be(false)
      expect(letterscard.save).to be(false)
    end
    it "should not save an old card" do 
      expect(oldcard.expiration_date > DateTime.now).to be(false) 
      expect(oldcard.save).to be(false)
    end
  end
end
