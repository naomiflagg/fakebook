class FriendshipsController < ApplicationController
  def index
    @friendships = current_user.friendships
  end
  
  def create
    other_user = User.find(params[:user])
    request = current_user.received_request?(other_user)
    return unless request

    friendship = current_user.friendships.build(friend_id: params[:user])
    request.destroy

    if friendship.save
      flash[:success] = "Aw, #{other_user.name} is now your friend!"
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = "Hmm. That didn't work."
    end
  end

  def destroy
    friendship = Friendship.find_by_id(params: id)
    return unless friendship

    if friendship.destroy
      flash[:success] = "I guess you and #{@user.name} are no longer friends."
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = 'It seems the universe wants you to remain friends.'
    end
  end
end
