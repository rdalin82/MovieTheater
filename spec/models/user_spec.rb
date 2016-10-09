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
end
