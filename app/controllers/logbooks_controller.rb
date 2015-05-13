class LogbooksController < ApplicationController
  before_action :authenticate_user!
  before_action :logbooks, only: [:index, :edit]

  def index
    @logbook = Logbook.new
  end

  def show
    @logbook = Logbook.find(params[:id])
  end

  def edit
    @logbook = Logbook.find(params[:id])
  end

  def create
    @logbook = Logbook.new(logbook_params)

    photo = Paperclip.io_adapters.for(params[:logbook][:photo])
    photo.original_filename = 'photo.png'
    @logbook.photo = photo

    credential = Paperclip.io_adapters.for(params[:logbook][:credential])
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

  def update
    @logbook = Logbook.find(params[:id])

    @logbook.first_name = logbook_params[:first_name]
    @logbook.second_name = logbook_params[:second_name]

    photo = Paperclip.io_adapters.for(params[:logbook][:photo])
    photo.original_filename = 'photo.png'
    @logbook.photo = photo if @logbook.photo != photo

    credential = Paperclip.io_adapters.for(params[:logbook][:credential])
    credential.original_filename = 'credential.png'
    @logbook.credential = credential if @logbook.credential != credential

    respond_to do |format|
      if @logbook.save
        format.html { redirect_to logbook_path, notice: 'Visitante actualizado correctamente' }
        format.json { render json: nil, status: 200 }
        format.js   { render json: nil, status: 200 }
      else
        flash.now[:aler] = 'Visitante no actualizado correctamente'
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
    @logbooks = Kaminari.paginate_array(Logbook.all.reverse).page(params[:page]).per(8)
  end
end
