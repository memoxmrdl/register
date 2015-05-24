class OfficesController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :offices, only: [:index, :edit]

  def index
    @office = Office.new
  end

  def show
    @office = Office.friendly.find(params[:id])
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
    @office = Office.find(params[:id])
  end

  def update
    @office = Office.find(params[:id])

    if @office
      @office.update_attributes(office_params)
      redirect_to offices_path, notice: 'Departamento actualizado'
    else
      flash.now[:alert] = 'Departamento ya existe o es vacio'
      render :edit
    end
  end

  def destroy
    @office = Office.find(params[:id])

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

  def offices
    @offices = Kaminari.paginate_array(Office.all.reverse).page(params[:page]).per(10)
  end
end
