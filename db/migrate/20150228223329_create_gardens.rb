class CreateGardens < ActiveRecord::Migration
  def change
    create_table :gardens do |t|
      t.integer :number
      t.string :name
      t.string :director
      t.string :address
      t.string :phone

      t.timestamps null: false
    end
  end
end
