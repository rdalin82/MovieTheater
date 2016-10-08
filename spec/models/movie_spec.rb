require 'rails_helper'

RSpec.describe Movie, type: :model do
  before do 
      Timecop.freeze(Time.new(2015, 10, 5))
    end
  after do 
    Timecop.return
  end
  describe "#save" do 
    let (:blankmovie) { Movie.new }
    let (:movie) { Movie.new(movie_name: "Secret Life of Pets", showtime: DateTime.new(2016, 10, 6, 20, 30), length: 120)}
    it "should not save a blank movie" do 
      expect(blankmovie.save).to be (false) 
    end
    it "should shave a valid movie" do 
      movie.auditorium = Auditorium.new(name: "test", capacity: 20) 
      expect(movie.save).to be(true)
    end
  end
  describe "#name, #length, #movie_time, #movie_date" do 
    let (:movie) { Movie.new(movie_name: "Secret Life of Pets", showtime: DateTime.new(2016, 10, 6, 20, 30), length: 120)}
    it "should have a movie_name, showtime, and length" do 
      expect(movie.movie_name).to eq("Secret Life of Pets")
      expect(movie.length).to eq(120)
      expect(movie.movie_time).to eq("08:30 PM")
      expect(movie.movie_end_time).to eq("10:30 PM")
      expect(movie.movie_date).to eq("October 6, 2016")
    end
  end
  describe "#upcoming?" do 
    let (:futuremovie) { Movie.new(movie_name: "Secret Life of Pets", showtime: DateTime.new(2016, 10, 6, 20, 30), length: 120)} 
    let (:pastmovie) { Movie.new(movie_name: "Toy Story", showtime: DateTime.new(1999, 10, 6, 20, 30), length: 120)}
    it "should recognize a future movie" do 
      expect(futuremovie.upcoming?).to be(true)
    end
    it "should recognize a past movie" do 
      expect(pastmovie.upcoming?).to be(false) 
    end
  end
end
