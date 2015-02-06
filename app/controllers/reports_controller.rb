class ReportsController < ApplicationController
  def index
    @reports = Report.where(verified: true)
  end
end
