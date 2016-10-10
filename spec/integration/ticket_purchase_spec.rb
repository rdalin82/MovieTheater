require 'rails_helper'

RSpec.describe "purchasing new tickets", type: :model do
  before do 
      Timecop.freeze(Time.new(2016, 10, 1))
    end
  after do 
    Timecop.return
  end 
  let (:auditorium) {Auditorium.create(name: "Test Auditorium", capacity: 3)}
  let(:movie) {
    auditorium.movies.create(
      movie_name: "Test Movie" , 
      showtime: DateTime.new(2016, 10, 6, 17, 00), 
      length: 120 
    ) 
  }

  it "should not let a user buy a ticket without a valid credit card" do 
    user = User.new(name: "John Smith", email: "Johnsmith@gmail.com")
    user.creditcard = Creditcard.create(number: "2444555566667777", expiration_date: DateTime.new(2018, 10))
    expect(movie.tickets.new(user: user).save && user.creditcard.valid?).to be(false)
    user2 = User.new(name: "Jenny Smith", email: "Jennysmith@gmail.com")
    user2.creditcard = Creditcard.create(number: "4444555566667777", expiration_date: DateTime.new(2015, 10))
    expect(movie.tickets.new(user: user2).save && user2.creditcard.valid?).to be(false)    
  end

  it "should let a a user buy a ticket with a valid credit card and sufficient capacity" do 
    user = User.new(name: "John Smith", email: "Johnsmith@gmail.com")
    user.creditcard = Creditcard.create(number: "4444555566667777", expiration_date: DateTime.new(2018, 10))
    expect(movie.tickets.new(user: user).save && user.creditcard.valid?).to be(true)
  end

  it "should not let a user buy a ticket without sufficient capacity" do 
    user = User.new(name: "John Smith", email: "Johnsmith@gmail.com")
    user.creditcard = Creditcard.create(number: "4444555566667777", expiration_date: DateTime.new(2018, 10))
    3.times { movie.tickets.new(user:user).save }
    expect(movie.tickets.count).to eq(3)
    expect(movie.tickets.new(user:user).save && user.creditcard.valid?).to be(false) 
  end

  it "should know which tickets a user has" do 
    user = User.new(name: "John Smith", email: "Johnsmith@gmail.com")
    user.creditcard = Creditcard.create(number: "4444555566667777", expiration_date: DateTime.new(2018, 10))
    3.times { movie.tickets.new(user:user).save }
    expect(movie.tickets.count).to eq(3)
    expect(user.tickets.count).to eq(3)
  end
end
