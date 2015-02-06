class ReportsController < ApplicationController
  before_action :authenticate_user!, only: []

  def index
    @reports = Report.where(verified: true)
  end
  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)

    if @report.save
      flash[:success] = 'Your report has been submitted.'
      redirect_to root_path
    else
      render :new
    end
  end

private

  def report_params
    params.require(:report).permit(:name, :state, :city, :agency, :month, :day, :year)
  end
end
