class WelcomeController < ApplicationController
  def index
    @movies = Movie.where('showtime > ?', DateTime.now).pluck(:movie_name)
    @titles = @movies.uniq
  end
end
