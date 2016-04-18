class CreateCategoriesFilms < ActiveRecord::Migration
  def change
    create_table :categories_films do |t|
      t.references :film
      t.references :category
    end
  end
end
