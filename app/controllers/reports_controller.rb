class ReportsController < ApplicationController
  before_action :authenticate_user!, only: [:check, :flop]
  before_action :set_report, only: [:verify, :archive, :edit, :update, :destroy]

  #index method
  #users can choose to filter by state and/or agency.
  #method will return only the verified reports in that filter (from params), sorted by date.
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
      flash[:failure] = 'Name, State, and City are all required in order to submit a report'
      render :new
    end
  end

  #index of unverified reports
  def check
    @reports = Report.where(verified: false, archived: false)
  end

  #page to verified reports
  def edit
    @agency = Agency.new
  end

  def update
    if @report.update_attributes(veri_params)
      flash[:success] = 'Report verified'
      redirect_to reports_check_path
    else
      @agency = Agency.new
      flash[:failure] = 'All fields must be filled out in order to verify.'
      render :edit
    end
  end

  #reports are not truely destroyed, but archived.
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

  #marks the report with a user id when it is verified.
  def veri_params
    params.require(:report).permit(:name, :state, :city, :agency_id, :incident_date).merge(verified: true, user_id: current_user.id)
  end
end
