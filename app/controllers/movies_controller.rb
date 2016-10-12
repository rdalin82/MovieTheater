class MoviesController < ApplicationController
  def index 
    @movies = Movie.where(auditorium_id: params[:auditorium_id])
  end
  def new 
    @movie = Movie.new
  end
  def show 
    @movie = Movie.find(params[:id])
  end
  def create
    @auditorium = Auditorium.find(params[:auditorium_id])
    @movie = @auditorium.movies.new(
      movie_name: params[:movie][:movie_name],
      showtime: DateTime.parse(params[:movie][:showtime]), 
      length: params[:movie][:movie_length].to_i
    )
    if @movie.save
      @movie.save 
      flash[:success] = ['movie successfully added']
      redirect_to ("/auditoriums/#{params[:auditorium_id]}/movies")
    else 
      flash[:warning] = @movie.errors.full_messages.to_sentence
      redirect_to ("/auditoriums/#{params[:auditorium_id]}/movies/new")
    end
  end
  def update
  end
  def destroy
    Movie.find(params[:id]).destroy
    flash[:success] = ["Movie deleted"]
    redirect_to ("/auditoriums/#{params[:auditorium_id]}/movies")
  end

  def showtimes
    @movies = Movie.where(movie_name: params[:movie_name]).sort_by(&:movie_date).sort_by(&:showtime)
  end
  private 
  def movie_params
    params.require(:movie).permit(:movie_name, :showtime, :length)
  end

end
