class AuditoriumsController < ApplicationController
  def index 
    @auditoria = Auditorium.all
  end
end
