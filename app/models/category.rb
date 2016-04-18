class Category < ActiveRecord::Base
  has_many :films, through: :categories_films
end