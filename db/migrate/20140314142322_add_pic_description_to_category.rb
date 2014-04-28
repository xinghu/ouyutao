class AddPicDescriptionToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :pic, :string
    add_column :categories, :description, :text
  end
end
