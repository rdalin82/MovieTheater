class Auditorium < ActiveRecord::Base
  belongs_to :theater
  validates :name, uniqueness: true , presence: true
  validates :capacity, presence: true
end
