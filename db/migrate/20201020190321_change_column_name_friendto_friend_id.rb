class ChangeColumnNameFriendtoFriendId < ActiveRecord::Migration[5.2]
  def change
    rename_column :friendships, :friend, :friend_id
  end
end
