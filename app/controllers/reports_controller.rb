class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :search_visits
  before_action :set_offices_and_logbooks

  def report
  end

  private

  def search_visits
    param_empty_convert_null(:start_date)
    param_empty_convert_null(:end_date)
    param_empty_convert_null(:office)
    param_empty_convert_null(:logbook)

    @visits = Visit.search(params[:start_date], params[:end_date], params[:office], params[:logbook])

    puts ">>>> #{params.empty?} #{@visits.count} %% #{@visits.inspect}"
  end

  def param_empty_convert_null(item)
    return unless params.include?(item)
    params[item] = nil if params[item].empty?
  end

  def set_offices_and_logbooks
    @offices = Office.all
    @logbooks = Logbook.all
  end
end
