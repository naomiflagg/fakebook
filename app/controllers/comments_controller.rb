class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :set_post, only: [:new, :edit, :create, :update, :destroy]
  
  def new
    @comment = current_user.comments.build
  end

  def edit
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = 'Comment saved.'
      redirect_to @post
    else
      flash.now[:alert] = 'Sorry, your comment could not be saved.'
    end
  end

  def update
    if @comment.update(comment_params)
      flash[:success] = 'Comment updated successfully.'
      redirect_to @post
    else
      flash.now[:alert] = 'Update could not be saved.'
    end
  end

  def destroy
    @comment.destroy
    redirect_back(fallback_location: @post)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
