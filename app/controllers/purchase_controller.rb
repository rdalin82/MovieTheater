class PurchaseController < ApplicationController
  def new 
    @user = User.new 
    @creditcard = Creditcard.new
  end
  def create
    @user = User.new(user_params)
    @card = Creditcard.new(
      number: params[:creditcard][:number], 
      expiration_date: DateTime.new(params[:creditcard][:year].to_i, params[:creditcard][:month].to_i)
    )
    if @user.save && @card.save 
      flash[:success] = ["Ticket purchase successful for #{Movie.find(params[:id]).movie_name}"]
      redirect_to root_path
    else 
      errors = []
      errors << @user.errors.full_messages.to_sentence unless @user.errors.nil?
      errors << @card.errors.full_messages.to_sentence unless @card.errors.nil?
      flash[:warning] = errors
      redirect_to root_path
    end
  end

  private 

  def user_params 
    params.require(:user).permit(:name, :email)
  end
  def card_params
    params.require(:creditcard).permit(:number, :month, :year)
  end

end
