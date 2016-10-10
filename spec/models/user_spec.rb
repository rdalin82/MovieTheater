require 'rails_helper'

RSpec.describe User, type: :model do
  let (:blankuser) { User.new }
  let (:user) {User.new(name: "John Smith", email: "Johnsmith@gmail.com") }
  let (:bademail1) { User.new(name: "John Smith", email: "Johnsmith@") }
  let (:bademail2) { User.new(name: "John Smith", email: "@gmail.com") }
  describe "#save" do 
    it "should not save a blank user" do 
      expect(blankuser.save).to be(false) 
    end
    it "should save a valid user" do 
      expect(user.save).to be(true)
    end
    it "should not save with a bad email" do 
      expect(bademail1.save).to be(false)
      expect(bademail2.save).to be(false)
    end
  end
  describe "update credit card" do 
    before do 
      Timecop.freeze(DateTime.new(2016, 10, 5, 13, 00))
    end
    after do 
      Timecop.return
    end
    let (:creditcard1) { Creditcard.new(number: "4444555566667777", expiration_date: DateTime.new(2017, 10) ) }
    let (:creditcard2) { Creditcard.new(number: "4444555566667777", expiration_date: DateTime.new(2018, 10) ) }
    it "should allow a user to update credit card" do 
      user.creditcard = creditcard1
      expect(user.creditcard).to eq(creditcard1)
      user.creditcard = creditcard2
      expect(user.creditcard).to eq(creditcard2)
    end
  end
end
