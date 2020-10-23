class UsersController < ApplicationController
  
  def index
    users = User.where.not(id: current_user.id)
    @users = users.includes(:profile).limit(10)
  end

  def show
    @user = User.find(params[:id])
  end
end
