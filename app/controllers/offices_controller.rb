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
      flash.now[:alert] = 'Departamento ya existe o es nulo'
      render :index
    end
  end

  private

  def office_params
    params.require(:office).permit(:name)
  end
end
