class WelcomeController < ApplicationController
  def index
    @titles = Movie.pluck(:movie_name).uniq
  end
end
