class FriendRequestsController < ApplicationController
  before_action :find_friend_requests, only: [:update, :destroy]

  def create
    current_user.friend_requests.create(accepted: false, friended_id: params[:user])
  end
  
  def update
    @friend_request = FriendRequest.find(params[:id])
    @friend_request.update(accepted: true)
  end

  def destroy
    @friend_request = FriendRequest.find(params[:id])
    @friend_request.destroy
  end

  private
  
  def find_friend_requests
    friends = [current_user.id, params[:user]]
    @friend_requests = FriendRequest.where(friended_id: friends).where(user_id: friends)
  end
end
