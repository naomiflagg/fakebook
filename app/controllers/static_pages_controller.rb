class StaticPagesController < ApplicationController
  def home
    @pending = current_user.friended_users.to_a + current_user.frienders.to_a
    @friends = current_user.friends
    @posts = Post.paginate(page: params[:page], per_page: 7).order('created_at DESC')
  end
end
