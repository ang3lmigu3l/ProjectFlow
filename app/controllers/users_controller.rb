class UsersController < ApplicationController

  

  def show
    @user = User.friendly.find(params[:id])
  end

  def profile
    @user = current_user
  end

end
