class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, :pic
      t.integer :category_id, :speed, :torque, :power
      t.text :description

      t.timestamps
    end
  end
end
