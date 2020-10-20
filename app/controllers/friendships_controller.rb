class FriendshipsController < ApplicationController
  
  def index
    @friendships = current_user.friends
  end

  def edit
  end

  def create
    @friendship = current_user.friendships.create(accepted: false, friend_id: params[:user])
  end
  
  def update
  end

  def destroy
  end

end
