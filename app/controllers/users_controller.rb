class UsersController < ApplicationController
  
  def index
    @users = User.where.not(id: current_user.id).paginate(page: params[:page], per_page: 15).order('last_name')
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where('user_id = ?', params[:id]).paginate(page: params[:page], per_page: 7).order('created_at DESC')
  end
end
