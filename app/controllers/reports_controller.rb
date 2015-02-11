class ReportsController < ApplicationController
  before_action :authenticate_user!, only: [:check, :flop]
  before_action :set_report, only: [:show, :verify, :archive, :edit, :update, :destroy]

  def index
    if (params[:agency] && Agency.all.collect(&:name).include?(params[:agency][:name]))
      agency = Agency.where(name: params[:agency][:name]).take
      @reports = Report.where(agency_id: agency.id).shuffle
    else
      @reports = Report.where(verified: true).shuffle
    end
  end

  def show
    @agency = Agency.find(@report.agency_id)
    @user = User.find(@report.user_id)
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
      redirect_to reports_check_path
    else
      @agency = Agency.new
      render :edit
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
