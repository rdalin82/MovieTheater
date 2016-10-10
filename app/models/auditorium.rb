class Auditorium < ActiveRecord::Base
  belongs_to :theater
  has_many :movies 
  validates :name, uniqueness: true , presence: true
  validates :capacity, presence: true

  def upcoming_movies? 
    return false if movies.empty?
    movies.each do |movie|    
      return true if movie.upcoming?
    end
    return false 
  end
end
