class Film < ActiveRecord::Base
has_many :categories_films
has_many :categories, through: :categories_films
has_many :reviews

has_many :ratings, as: :rateable
has_many :comments, as: :commentable

validates :title,:description, presence: true
end