class CreateSpecies < ActiveRecord::Migration
  def change
    create_table :species do |t|
      t.string :name, null: false
      t.string :thumbnail, null: false 
    end
  end
end
