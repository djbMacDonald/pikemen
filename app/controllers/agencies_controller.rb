class AgenciesController < ApplicationController
  def create
    @agency = Agency.new(agency_params)

    if @agency.save
      flash[:success] = 'Your agency has been submitted.'
      redirect_to :back
    else
      render :new
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
