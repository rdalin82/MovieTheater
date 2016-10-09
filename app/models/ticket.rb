class Ticket < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user  
  validates :movie, :user, presence: true 
  validate :valid_sale

  private 

  def valid_sale
    seats_available?
    movie_upcoming?
  end
  def seats_available? 
    errors.add(
      :ticket, 
      message: "There are no more tickets available for this movie's showtime"
    ) unless movie.auditorium.capacity > movie.tickets.count 
  end
  def movie_upcoming? 
    errors.add(
      :ticket, 
      message: "It is too late to purchase tickets for this movie, please try a later time"
    ) unless movie.upcoming? 
  end
end
