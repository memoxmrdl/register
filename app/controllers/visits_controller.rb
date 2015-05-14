class VisitsController < ApplicationController
  before_action :load_data

  def index
  end

  def create
    @visit = Visit.new
    @logbook = Logbook.find(params[:select_logbook])
    @office = Office.find(params[:select_office])

    @visit.register_at = DateTime.now
    @visit.logbook = @logbook
    @visit.office = @office

    if @visit.save
      redirect_to visits_path, notice: 'Visita registrada correctamente'
    else
      redirect_to visits_path, alert: 'Visita no registrada posiblemente ya existe alguna en recientes'
    end
  end

  def output
    @visit = Visit.find(params[:id])

    if @visit
      @visit.output_at = DateTime.now
      @visit.save

      redirect_to visits_path, notice: 'Visita con salida correctamente'
    else
      redirect_to visits_path, notice: 'Visita no encontrada'
    end
  end

  private

  def load_data
    @current_visits = Kaminari.paginate_array(Visit.current_visits).page(params[:current_visits_page]).per(10)
    @past_visits = Kaminari.paginate_array(Visit.past_visits).page(params[:past_visits_page]).per(10)
    @logbooks = Logbook.all.reverse
    @offices = Office.all.reverse
    @visit = Visit.new
  end
end
