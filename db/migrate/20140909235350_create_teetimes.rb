class CreateTeetimes < ActiveRecord::Migration
  def change
    create_table :teetimes do |t|
      t.datetime :date
      t.boolean :finished
      t.string :course
      t.integer :owner_id
      t.string :player1
      t.string :player2
      t.string :player3
      t.string :player4

      t.timestamps
    end
  end
end
