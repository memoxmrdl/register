class VisitsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_data
  before_action :find_logbook_and_office, only: :create

  def index
  end

  def create
    @visit = Visit.new

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
    @current_visits = kaminari_page(Visit.current_visits.reverse, params[:current_visits_page], 10)
    @past_visits = kaminari_page(Visit.past_visits.reverse, params[:past_visits_page], 7)
    @logbooks = Logbook.all.reverse
    @offices = Office.all.reverse
    @visit = Visit.new
  end

  def kaminari_page(array, page, per)
    Kaminari.paginate_array(array).page(page).per(per)
  end

  def find_logbook_and_office
    @logbook = Logbook.find(params[:select_logbook])
    @office = Office.find(params[:select_office])
  rescue ActiveRecord::RecordNotFound
    redirect_to_with_error
  end

  def redirect_to_with_error
    redirect_to visits_path, alert: 'Surgio un error inesperado'
  end
end
