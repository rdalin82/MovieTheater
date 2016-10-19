class User < ActiveRecord::Base
  has_many :tickets
  has_one :creditcard
  validates :name, :email, presence: true
  validate :valid_email
  before_validation :downcase_email

  private 
  def downcase_email
    self.email.downcase! unless email.nil?
  end

  def valid_email
    return false if email.nil?
    errors.add(
      :email, 
      message: "Not a valid email format"
    ) unless email.match(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/)
  end
end
