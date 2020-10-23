class RenameColumnFrienderId < ActiveRecord::Migration[5.2]
  def change
    rename_column :friend_requests, :friender_id_id, :friender_id
  end
end
