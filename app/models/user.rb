class User < ActiveRecord::Base
  has_many :tickets
  has_one :creditcard
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
