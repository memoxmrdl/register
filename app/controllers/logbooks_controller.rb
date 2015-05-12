class LogbooksController < ApplicationController
  before_action :authenticate_user!
  helper :headshot

  def index
  end

  def new
    @logbook = Logbook.new
  end

  def create
    @logbook = Logbook.new(logbook_params)

    if @logbook.save
      redirect_to logbook_path, notice: 'Registro creado...'
    end

    flash.now[:alert] = 'Su petición fue inprocesable'
    render :new
  end

  private

  def logbook_params
    params.require(:logbook).permit(:first_name, :second_name)
  end
end
