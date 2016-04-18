class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment_body, null: false
      t.references :commentable, polymorphic: true, index: true
      t.references :user, null: false, index: true

      t.timestamps null: false
    end
  end
end
