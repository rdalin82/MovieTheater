class Movie < ActiveRecord::Base
  belongs_to :auditorium
  has_many :tickets 
  validates :movie_name, :length, :showtime, :auditorium, presence: true
  validate :validate_auditorium_availability

  def movie_time
    showtime.strftime("%I:%M %p")
  end
  def movie_end_time
    (showtime+length.minutes).strftime("%I:%M %p")
  end
  def movie_date
    showtime.strftime("%B %-d, %Y")
  end
  def upcoming?
    showtime > DateTime.now
  end
  def end_time
    showtime+length.minutes
  end
  def sold_out? 
    auditorium.capacity <= tickets.count 
  end

  private 
  def check_start_time(movie)
    showtime.between?(movie.showtime, movie.end_time) || movie.showtime.between?(showtime, end_time)
  end
  def check_end_time(movie)
    end_time.between?(movie.showtime, movie.end_time) || movie.end_time.between?(showtime, end_time)
  end
  def auditorium_available? 
    return false if auditorium.nil?
    Movie.where(auditorium: auditorium).find { |x| x.persisted? && check_end_time(x) || check_start_time(x) } ? false : true
  end
  def validate_auditorium_availability
    errors.add(:auditorium,
      message: "Auditorium is already booked"
    ) unless auditorium_available?
  end
  def validate_upcoming_movie
    errors.add(:auditorium,
     message: "It is too late to purchase tickets for this movie, please try a later time"
     ) unless upcoming? 
  end
end
