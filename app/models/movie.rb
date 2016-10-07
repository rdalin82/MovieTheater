class Movie < ActiveRecord::Base
  belongs_to :auditorium
  validates :movie_name, :length, :showtime, presence: true

  def movie_time
    showtime.strftime("%I:%M %p")
  end
  def movie_date
    showtime.strftime("%B %-d, %Y")
  end
end
