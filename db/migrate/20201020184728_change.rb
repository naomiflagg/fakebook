class Change < ActiveRecord::Migration[5.2]
  def change
    rename_table :friend_requests, :friendships
  end
end
