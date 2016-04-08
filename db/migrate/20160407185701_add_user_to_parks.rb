class AddUserToParks < ActiveRecord::Migration
  def change
    add_reference :parks, :user
  end
end
