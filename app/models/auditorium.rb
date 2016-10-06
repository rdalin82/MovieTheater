class Auditorium < ActiveRecord::Base
  belongs_to :theater
  validates :name, :capacity, :theater, presence: true
end
