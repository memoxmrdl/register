class VisitsController < ApplicationController
  def index
    @logbooks = Logbook.all.reverse
  end
end
