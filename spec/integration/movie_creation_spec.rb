require 'rails_helper'

RSpec.describe "creating theater, auditorium, movies", type: :model do
  before do 
      Timecop.freeze(Time.new(2016, 10, 1))
    end
  after do 
    Timecop.return
  end 

  let (:theater) { Theater.create(name: "Test Theater") }

  let (:auditorium1) {theater.auditoria.create(name: "auditorium one", capacity: 80)}
  let (:auditorium2) {theater.auditoria.create(name: "auditorium two", capacity: 60)}
  let (:auditorium3) {theater.auditoria.create(name: "auditorium three", capacity: 40)}
  let (:auditorium4) {theater.auditoria.create(name: "auditorium one", capacity: 100)}
  let (:auditorium5) {theater.auditoria.create(name: "auditorium one", capacity: 120)}

  it "Should have movies that belong to an auditorium" do 
    movie1 = auditorium1.movies.create!(movie_name: "Test Movie" , showtime: DateTime.new(2016, 10, 6, 17, 00), length: 120 )
    movie2 = auditorium2.movies.create!(movie_name: "Test Movie 2", showtime: DateTime.new(2016, 9, 30, 14, 00), length: 80)
    
    expect(movie1.persisted?).to be(true)
    expect(movie1.auditorium).to be(auditorium1)
    expect(auditorium1.movies.size).to eq(1)
    expect(movie1.upcoming?).to be(true)

    expect(movie2.persisted?).to be(true)
    expect(movie2.auditorium).to be(auditorium2)
    expect(auditorium2.movies.size).to eq(1) 
    expect(movie2.upcoming?).to be(false)
  end

  
  describe "#auditorium_available?" do
    let (:auditorium) { theater.auditoria.create(name: "Test auditorium", capacity: 20) }

    it "Should not have 2 movies playing in the same auditorium" do 
      movie1 = auditorium.movies.create!(movie_name: "Test Movie", showtime: DateTime.new(2016, 10, 7, 12, 00), length: 120)
      expect(movie1.persisted?).to be(true)

      movie2 = auditorium.movies.new(movie_name: "not valid", showtime: DateTime.new(2016, 10, 7, 12, 30), length: 120)
      expect(movie2.save).to be(false)

      movie3 = auditorium.movies.new(movie_name: "after test", showtime: DateTime.new(2016, 10, 7, 15, 31), length: 60)
      expect(movie3.showtime.between?(movie1.showtime, movie1.showtime+movie1.length.minutes)).to be(false)
      expect(movie3.save).to be(true)

      movie_noon = auditorium.movies.new(movie_name: "first movie", showtime: DateTime.new(2016, 10, 8, 12, 00), length: 119)
      movie_thirty_later = auditorium.movies.new(movie_name: "Thirty Minutes Later", showtime: DateTime.new(2016, 10, 8, 12, 30), length: 40)
      movie_hour_later = auditorium.movies.new(movie_name: "Hour Later", showtime: DateTime.new(2016, 10, 8, 13, 00), length: 60) 
      movie_two_hour_later = auditorium.movies.new(movie_name: "2 Hours Later", showtime: DateTime.new(2016, 10, 8, 14, 30), length: 60)
      expect(movie_thirty_later.save).to be (true)
      movie_thirty_later.save 
      expect(movie_noon.save).to be (false)
      expect(movie_hour_later.save).to be (false) 
      expect(movie_two_hour_later.save).to be (true) 
      expect(auditorium.movies.count).to be(4)
    end
  end
end
