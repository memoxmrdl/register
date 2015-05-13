class LogbooksController < ApplicationController
  before_action :authenticate_user!
  before_action :logbooks, only: [:index]

  def index
    @logbook = Logbook.new
  end

  def show
    @logbook = Logbook.find_by_id(params[:id])
  end

  def create
    @logbook = Logbook.new(logbook_params)

    photo = Paperclip.io_adapters.for(params[:logbook][:photo])
    photo.original_filename = 'photo.png'
    @logbook.photo = photo

    credential = Paperclip.io_adapters.for(params[:logbook][:photo])
    credential.original_filename = 'credential.png'
    @logbook.credential = credential

    respond_to do |format|
      if @logbook.save
        format.html { redirect_to logbook_path, notice: 'Se ah creado correctamente' }
        format.json { render json: nil, status: 200 }
        format.js   { render json: nil, status: 200 }
      else
        flash.now[:aler] = 'No fue creado correctamente'
        format.html { render action: 'new' }
        format.json { render json: @logbook.errors, status: :unprocessable_entity }
        format.js   { render json: @logbook.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def logbook_params
    params.require(:logbook).permit(
      :first_name,
      :second_name,
      :photo,
      :credential
    )
  end

  def logbooks
    @logbooks = Logbook.page(params[:page]).per(8)
  end
end
