class Film < ActiveRecord::Base
has_many :categories_films
has_many :categories, through: :categories_films
has_many :reviews

has_many :ratings, as: :rateable
has_many :comments, as: :commentable

validates :title,:description, presence: true

  def total_ratings
    if ratings.any?
      ratings.sum(:rating)
    end
  end

  def average_rating
    if ratings.any?
      total_ratings/ratings.count
    end
  end

  def self.search(search)
    where("title ILIKE ?", "%#{search}%") 
    where("description ILIKE ?", "%#{search}%")
  end

end