class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title, null: false , index: true
      t.string :description, null: false
      t.string :picture

      t.timestamps null: false
    end
  end
end
