class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :number
      t.string :name
      t.string :manager
      t.text :notes
      t.belongs_to :garden, index: true

      t.timestamps null: false
    end
    add_foreign_key :groups, :gardens
  end
end
