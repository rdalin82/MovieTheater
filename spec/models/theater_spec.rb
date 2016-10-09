require 'rails_helper'

RSpec.describe Theater, type: :model do
  let (:blanktheater) { Theater.new }
  let (:validtheater) { Theater.new(name: "Regal Theater") }
  describe "#save" do 
    it "should note create theater without a name" do 
      expect(blanktheater.save).to be(false) 
    end
    it "should create valid theater" do 
      expect(validtheater.save).to be(true) 
    end
  end
  describe "#uniqueness" do
    let (:theater) { Theater.new(name:"test") }
    it "should have 2 auditoria" do 
      theater.save
      theater.auditoria.create(name:"test", capacity: 1)
      theater.auditoria.create(name:"test2", capacity: 1)
      expect(theater.auditoria.size).to be(2)
    end
    it "should not have 2 of the same name" do 
      duplicate = Theater.new(name: "Regal Theater") 
      expect(validtheater.save && duplicate.save).to be(false) 
    end
  end
end
