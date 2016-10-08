class Auditorium < ActiveRecord::Base
  belongs_to :theater
  has_many :movies 
  validates :name, uniqueness: true , presence: true
  validates :capacity, presence: true

end
