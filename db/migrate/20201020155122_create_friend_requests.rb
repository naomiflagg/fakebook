class CreateFriendRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_requests do |t|
      t.boolean :accepted
      t.references :friender, foreign_key: { to_table: :users }
      t.references :friended, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
