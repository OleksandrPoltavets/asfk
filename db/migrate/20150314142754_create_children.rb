class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.belongs_to :user, index: true
      t.belongs_to :group, index: true
      t.string :name
      t.date :birthday

      t.timestamps null: false
    end
    add_foreign_key :children, :users
    add_foreign_key :children, :groups
  end
end
