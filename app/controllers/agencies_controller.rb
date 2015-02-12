class AgenciesController < ApplicationController

  #Agencies are created by a form in the Report Edit page.
  def create
    @agency = Agency.new(agency_params)
    if @agency.save
      flash[:success] = 'Your agency has been submitted.'
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def show
    @agency = Agency.find(params[:id])
  end

  private

  def agency_params
    params.require(:agency).permit(:name, :jurisdiction)
  end
end
