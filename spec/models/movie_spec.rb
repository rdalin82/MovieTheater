require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "creating new movies" do 
    before do 
      Timecop.freeze(Time.new(2016, 10, 5))
    end
    after do 
      Timecop.return
    end
    let (:blankmovie) { Movie.new }
    let (:movie) { Movie.new(movie_name: "Secret Life of Pets", showtime: DateTime.new(2016, 10, 6, 20, 30), length: 120)}
    it "should not save a blank movie" do 
      expect(blankmovie.save).to be (false) 
    end
    it "should shave a valid movie" do 
      expect(movie.save).to be(true)
    end
  end
  describe "displaying name, showtime, and length" do 
    let (:movie) { Movie.new(movie_name: "Secret Life of Pets", showtime: DateTime.new(2016, 10, 6, 20, 30), length: 120)}
    it "should have a movie_name, showtime, and length" do 
      expect(movie.movie_name).to eq("Secret Life of Pets")
      expect(movie.movie_time).to eq("08:30 PM")
      expect(movie.movie_date).to eq("October 6, 2016")
    end
  end
end
