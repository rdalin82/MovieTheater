class WelcomeController < ApplicationController
  def index
    @movies = Movie.all.sort_by(&:movie_date).sort_by(&:movie_name).sort_by(&:showtime)
  end
end
