class Film < ActiveRecord::Base
has_many :Categories, through: :categories_films
# has_many :ratings as: :ratable
# has_many :reviews 
# has_many :comments as: :commentable
end