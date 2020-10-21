class UsersController < ApplicationController
  before_action :find_friend_ids, only: [:home, :index]
  
  def home
  end

  def index
    users = User.where.not(id: current_user.id)
    @users = users.includes(:profile).limit(10)
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
  end
end
