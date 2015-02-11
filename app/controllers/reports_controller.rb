class ReportsController < ApplicationController
  before_action :authenticate_user!, only: [:check, :flop]
  before_action :set_report, only: [:verify, :archive, :edit, :update, :destroy]

  def index
    @reports = Report.where(verified: true)
    if (params[:agency] && Agency.all.collect(&:name).include?(params[:agency][:name]))
      agency = Agency.where(name: params[:agency][:name]).take
      @reports = @reports.where(agency_id: agency.id)
    end
    if (params[:state] && Report::STATES.include?(params[:state][:name]))
      @reports = @reports.where(state: params[:state][:name])
    end
    @reports = @reports.sort_by(&:incident_date)
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
      # flash[:success] = 'Report verified'
      redirect_to reports_check_path
    else
      @agency = Agency.new
      redirect_to action: "edit", id: @report.id
    end
  end

  def destroy
    @report.archived = true
    @report.save(validate: false)
    redirect_to :back
  end

private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:name, :state, :city, :incident_date)
  end

  def veri_params
    params.require(:report).permit(:name, :state, :city, :agency_id, :incident_date).merge(verified: true, user_id: current_user.id)
  end
end
