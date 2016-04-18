class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :review_title, null: false
      t.text :review_content, null: false
      t.boolean :recommend, null: false
      t.references :user, null: false, index: true
      t.references :film, null: false, index: true

      t.timestamps null: false
    end
  end
end
