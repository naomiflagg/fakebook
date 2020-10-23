class ReplaceColumnFriendRequests < ActiveRecord::Migration[5.2]
  def change
    remove_column :friend_requests, :user_id
    add_reference :friend_requests, :friender_id, foreign_key: { to_table: :users } 
  end
end
