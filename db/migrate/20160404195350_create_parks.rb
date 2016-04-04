class CreateParks < ActiveRecord::Migration
  def change
    create_table :parks do |t|
      t.string :name, null: false
      t.string :street
      t.text :description 
    end
  end
end
