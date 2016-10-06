require 'rails_helper'

RSpec.describe Theater, type: :model do
  let (:blanktheater) { Theater.new }
  let (:validtheater) { Theater.new(name: "Regal Theater") }
  describe "create new theater" do 
    it "should note create theater without a name" do 
      expect(blanktheater.save).to be(false) 
    end
    it "should create valid theater" do 
      expect(validtheater.save).to be(true) 
    end
  end
end
