class ReportsController < ApplicationController
  include Userable

  before_action :set_offices_and_logbooks

  has_scope :by_period, using: [:started_at, :ended_at], type: :hash
  has_scope :office
  has_scope :logbook

  def index
    @visits = apply_scopes(Visit).all_without_output
  end

  private
  def set_offices_and_logbooks
    @offices = Office.all
    @logbooks = Logbook.all
  end
end
