class AuditoriumsController < ApplicationController
  def index 
    @auditoria = Auditorium.all
  end
  def new 
    @auditorium = Auditorium.new 
  end
  def edit 
      @auditorium = Auditorium.find(params[:id])
  end
  def create
    @auditorium = Auditorium.new(auditorium_params)
    if @auditorium.save 
      flash[:success] = ["Auditorium succssfully added"]
      @auditorium.save
      redirect_to ("/auditoriums")
    else 
      flash[:warning] = @auditorium.errors.full_messages.to_sentence
      redirect_to ("/auditoriums/new")
    end
  end
  def update 
    @auditorium = Auditorium.find(params[:id])
    if @auditorium.update(auditorium_params)
      redirect_to("/auditoriums")
    else
      render "edit"
    end
  end

  def destroy
    Auditorium.find(params[:id]).destroy
    flash[:success] = ['Auditorium deleted']
    redirect_to ('/auditoriums')
  end
  private 

  def auditorium_params 
    params.require(:auditorium).permit(:name, :capacity)
  end
end
