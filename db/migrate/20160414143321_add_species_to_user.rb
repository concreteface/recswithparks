class AddSpeciesToUser < ActiveRecord::Migration
  def change
    add_column :users, :species_id, :integer
  end
end
