class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :description
      t.string :profile_image
      t.string :gear
      t.integer :user_id

      t.timestamps
    end
  end
end
