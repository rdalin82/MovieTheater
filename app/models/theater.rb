class Theater < ActiveRecord::Base
  has_many :auditoria
  validates :name, presence: true 
end
