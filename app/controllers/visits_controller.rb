class VisitsController < ApplicationController
  def index
    @visits = Visit.all.reverse
    @logbooks = Logbook.all.reverse
    @offices = Office.all.reverse
    @visit = Visit.new
  end

  def create
    @visit = Visit.new
    @logbook = Logbook.find(params[:select_logbook])
    @office = Office.find(params[:select_office])

    @visit.register_at = Time.now
    @visit.logbook = @logbook
    @visit.office = @office

    if @visit.save
      redirect_to visits_path, notice: 'Visita registrada correctamente'
    else
      flash.now[:alert] = 'Hubo un error'
      render :new
    end
  end
end
