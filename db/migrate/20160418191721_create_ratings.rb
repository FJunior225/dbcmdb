class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rateable_id
      t.string  :rateable_type
      t.integer :rating, default: 0
      t.references :user

      t.timestamps null: false
    end
  end
end
