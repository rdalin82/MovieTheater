class Creditcard < ActiveRecord::Base
  belongs_to :user
  validates :number,  presence: true 
  validates :number, length: { is: 16 } 
  validates :expiration_date, presence: true
  validate  :not_expired?
  validate  :start_number_valid?
  
  private 

  def not_expired?
    return false if expiration_date.nil?
    errors.add(
      :expiration_date, 
      message: "You cannot use an expired card"
    ) unless expiration_date > DateTime.now
  end

  def start_number_valid? 
    return false if number.nil?
    errors.add(
      :number, 
      message: "Not a valid credit card number"
    ) unless number.match(/\A(3|4|5|6)/) && !number.match(/\D/)
  end
end
