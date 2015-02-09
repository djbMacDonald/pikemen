class ReportsController < ApplicationController
  before_action :authenticate_user!, only: [:check, :flop]
  before_action :set_report, only: [:verify, :archive, :edit, :update, :destroy]

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

  def check
    @reports = Report.where(verified: false, archived: false)
  end

  def edit
    @agency = Agency.new
  end

  def update
    if @report.update_attributes(veri_params)
      flash[:success] = 'Report verified'
      redirect_to root_path
    else
      @agency = Agency.new
      render :edit
    end
  end

  def destroy
    @report.archived = true
    @report.save
    redirect_to :back
  end

private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:name, :state, :city, :month, :day, :year)
  end

  def veri_params
    params.require(:report).permit(:name, :state, :city, :agency_id, :month, :day, :year).merge(verified: true, user_id: current_user.id)
  end
end
