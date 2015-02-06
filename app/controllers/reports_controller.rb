class ReportsController < ApplicationController
  def index
    @reports = Report.where(verified: true)
  end
  def new
    @report = Report.new
  end
end
