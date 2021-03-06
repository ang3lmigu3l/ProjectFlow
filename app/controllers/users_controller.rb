class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:show]
  def show
    @user = User.friendly.find(params[:id])
  end

  def flow
    @user = current_user
  end

end
