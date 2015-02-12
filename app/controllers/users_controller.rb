class UsersController < ApplicationController

  #will show all verified reports verified by a particular user.
  def show
    @user = User.find(params[:id])
  end
end
