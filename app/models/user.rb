class User < ActiveRecord::Base
  belongs_to :ticket
  has_many :creditcards
  validates :name, :email, presence: true
  validate :valid_email

  private 

  def valid_email
    return false if email.nil?
    errors.add(
      :email, 
      message: "Not a valid email format"
    ) unless email.match(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/)
  end
end
