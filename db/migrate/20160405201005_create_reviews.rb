class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.string :body, null: false
      t.belongs_to :user, null: false
      t.belongs_to :park, null: false
    end
  end
end
