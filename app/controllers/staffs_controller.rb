class StaffsController < ApplicationController
  def new
    @office = Office.friendly.find(params[:office_id])
    @staff = Staff.new
  end

  def create
    @office = Office.friendly.find(params[:office_id])
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
    @staff = Staff.find(params[:id])
    @office = @staff.office
  end

  def update
    @staff = Staff.find(params[:id])

    if @staff.update_attributes(staff_params)
      redirect_to office_path(@staff.office), notice: 'Staff actualizado'
    else
      flash.now[:error] = 'Staff ya existe o campo vacio'
      render :edit
    end
  end

  def destroy
    @staff = Staff.find(params[:id])
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
end
