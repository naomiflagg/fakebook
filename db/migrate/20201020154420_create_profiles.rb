class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.date :birthday
      t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
