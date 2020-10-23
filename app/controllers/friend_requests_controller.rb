class FriendRequestsController < ApplicationController
  def create
    other_user = User.find(params[:user])
    request = current_user.sent_requests.build(friended_id: other_user.id)

    if request.save
      flash[:success] = 'Request sent!'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = "Hmm. That did'nt work."
    end
  end

  def destroy
    request = FriendRequest.find_by_id(params[:id])
    return unless request

    if request.destroy
      flash[:success] = 'Request deleted. Ouch.'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = 'Sorry, that did not work.'
    end
  end
end
