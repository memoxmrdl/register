class OfficesController < ApplicationController
  before_action :authenticate_user!, except: :visits
  before_action :set_office, except: [:index, :create]
  before_action :set_offices, only: [:index, :edit]

  def index
    @office = Office.new
  end

  def show
  end

  def visits
    @visits = Visit.current_visits.where(office: @office)

    render layout: 'normal'
  rescue ActiveRecord::RecordNotFound
    render text: 'Surgio un problema contacte al administrador para reportar el problema'
  end

  def create
    @office = Office.new(office_params)

    if @office.save
      redirect_to offices_path, notice: 'Departamento creado'
    else
      redirect_to offices_path, alert: 'Departamento ya existe o es vacio'
    end
  end

  def edit
  end

  def update
    if @office
      @office.slug = nil
      @office.update_attributes(office_params)
      redirect_to offices_path, notice: 'Departamento actualizado'
    else
      flash.now[:alert] = 'Departamento ya existe o es vacio'
      render :edit
    end
  end

  def destroy
    if @office
      @office.destroy
      redirect_to offices_path, notice: 'Departamento eliminado'
    else
      redirect_to offices_path, alert: 'Departamento no existe para eliminar'
    end
  end

  private

  def office_params
    params.require(:office).permit(:name)
  end

  def set_offices
    @offices = Kaminari.paginate_array(Office.all.reverse).page(params[:page]).per(10)
  end

  def set_office
    @office = Office.friendly.find(params[:id])
  end
end
