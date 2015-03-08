class AddGardenIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :garden_id, :integer
  end
end
