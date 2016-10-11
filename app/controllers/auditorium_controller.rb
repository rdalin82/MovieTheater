class AuditoriumController < ApplicationController
  def index 
    @auditoria = Auditorium.all
  end
end
