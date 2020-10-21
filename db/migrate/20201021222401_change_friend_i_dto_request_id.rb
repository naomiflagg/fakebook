class ChangeFriendIDtoRequestId < ActiveRecord::Migration[5.2]
  def change
    rename_column :friendships, :friend_id, :friended_id
    rename_table :friendships, :friend_requests
  end
end
