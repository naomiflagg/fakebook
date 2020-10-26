class LikesController < ApplicationController 
  before_action :set_post

  def create
    @like = current_user.likes.create(post_id: @post.id)
    redirect_back(fallback_location: @post)
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_back(fallback_location: @post)
  end

  private
  
  def set_post
    @post = Post.find(params[:post_id])
  end
end
