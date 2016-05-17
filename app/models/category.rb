class Category < ActiveRecord::Base
  has_many :categories_films 
  has_many :films, through: :categories_films
  validates :name, presence: true

end