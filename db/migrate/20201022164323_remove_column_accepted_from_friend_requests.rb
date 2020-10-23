class RemoveColumnAcceptedFromFriendRequests < ActiveRecord::Migration[5.2]
  def change
    remove_column :friend_requests, :accepted
  end
end
