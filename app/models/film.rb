class Film < ActiveRecord::Base
has_many :Categories, through: :categories_films 
validates :title,:description, presence: true
# has_many :ratings as: :ratable
# has_many :reviews 
# has_many :comments as: :commentable
end