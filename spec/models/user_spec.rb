require 'rails_helper'

RSpec.describe User, type: :model do
  let (:blankuser) { User.new }
  let (:user) {User.new(name: "John Smith", email: "Johnsmight@gmail.com") }
  describe "#save" do 
    it "should not save a blank user" do 
      expect(blankuser.save).to be(false) 
    end
    it "should save a valid user" do 
      expect(user.save).to be(true)
    end
  end
end
