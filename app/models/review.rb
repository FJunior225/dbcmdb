class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :film
  has_many :comments, as: :commentable
  has_many :ratings, as: :rateable

  validates :review_title, :review_content, :user_id, :film_id, { presence: true }

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

  def positive_ratings
    if ratings.any?
      ratings.where('rating  > ?', 0).count
    else
      positive_ratings = 0
    end
  end

end
