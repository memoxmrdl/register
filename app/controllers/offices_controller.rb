class OfficesController < ApplicationController
  def index
    @offices = Office.all
    @office = Office.new
  end

  def create
    @offices = Office.all
    @office = Office.new(office_params)

    if @office.save
      redirect_to offices_path, notice: 'Departamento creado'
    else
      flash.now[:alert] = 'Departamento ya existe o es vacio'
      render :index
    end
  end

  def edit
    @offices = Office.all
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
end
