class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :number
      t.string :name
      t.string :manager
      t.text :notes
      t.integer :garden_number

      t.timestamps null: false
    end
  end
end
