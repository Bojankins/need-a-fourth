class AddUserIdToTeetimes < ActiveRecord::Migration
  def change
    add_column :teetimes, :user_id, :integer
  end
end
