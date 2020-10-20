class ChangeColumnNamesFriendships < ActiveRecord::Migration[5.2]
  def change
    change_table :friendships do |t|
      t.remove :accepted, :friended_id
      t.rename :friender_id, :friend
      t.references :user, foreign_key: true
    end
  end
end
