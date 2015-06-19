class StaffsController < ApplicationController
  include Userable

  before_action :set_office, only: [:new, :create]
  before_action :set_staff, only: [:edit, :update, :destroy]

  def new
    @staff = Staff.new
  end

  def staffs_logbook
    @staffs = Staff.where(office_id: params[:office_id])

    respond_to do |format|
      format.js
    end
  end

  def create
    @staff = Staff.new(staff_params)
    @staff.office = @office

    if @staff.save
      redirect_to office_path(@office), notice: 'Staff creado'
    else
      flash.now[:error] = 'Staff no creado'
      render :new
    end
  end

  def edit
    @office = @staff.office
  end

  def update
    if @staff.update_attributes(staff_params)
      redirect_to office_path(@staff.office), notice: 'Staff actualizado'
    else
      flash.now[:error] = 'Staff ya existe o campo vacio'
      render :edit
    end
  end

  def destroy
    @office = @staff.office

    if @staff
      @staff.destroy
      redirect_to office_path(@office), notice: 'Staff eliminado'
    else
      redirect_to office_path(@office), alert: 'Staff no existe para eliminar'
    end
  end

  private

  def staff_params
    params.require(:staff).permit(:name, :position)
  end

  def set_office
    @office = Office.friendly.find(params[:office_id])
  end

  def set_staff
    @staff = Staff.find(params[:id])
  end
end
