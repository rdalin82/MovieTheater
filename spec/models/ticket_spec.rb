require 'rails_helper'

RSpec.describe Ticket, type: :model do
  before do 
      Timecop.freeze(DateTime.new(2016, 10, 5, 13, 00))
    end
  after do 
    Timecop.return
  end
  let(:auditorium) {Auditorium.new(name: "test auditorium one", capacity: 5) }
  let(:movie) { auditorium.movies.new(movie_name: "Test movie", showtime: DateTime.new(2016, 10, 6, 12, 00), length: 120) }
  let(:latemovie) { auditorium.movies.new(movie_name: "Test movie", showtime: DateTime.new(2016, 10, 5, 12, 00), length: 120) }
  describe "#save" do 
    it "should reject an invalide ticket" do 
      ticket = movie.tickets.new()
      expect(ticket.save).to be(false)
      ticket.save
      expect(movie.tickets.count).to eq(0)
    end
    it "should save a new valid ticket" do 
      ticket = movie.tickets.new()
      ticket.user = User.create(
        name: "John Smith", 
        email: "JohnSmith@gmail.com"
      )
      expect(ticket.save).to be(true)
      expect(movie.tickets.count).to eq(1) 
    end
    it "should not save a ticket for a late movie" do 
      ticket = latemovie.tickets.new()
      ticket.user = User.create(
        name: "John Smith", 
        email: "JohnSmith@gmail.com"
      )
      expect(ticket.save).to be(false)
      expect(movie.tickets.count).to eq(0)
    end
    it "should not save a ticket if the theater is full" do 
      expect(movie.tickets.count).to eq(0)
      5.times do |x| 
        ticket = movie.tickets.new()
        ticket.user = User.create( name: "John Smith", email: "JohnSmith@gmail.com" ) 
        ticket.save
      end
      expect(movie.auditorium.capacity > 5).to be(false)
      expect(movie.tickets.count).to eq(5)
      ticket = movie.tickets.new()
      ticket.user = User.create( name: "John Smith", email: "JohnSmith@gmail.com" ) 
      expect(ticket.save).to be(false) 
    end
  end
end
