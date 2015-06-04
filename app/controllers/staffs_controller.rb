class StaffsController < ApplicationController
  def new
    @office = Office.friendly.find(params[:office_id])
    @staff = Staff.new
  end
end
