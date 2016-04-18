class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :film
  has_many :comments, as :commentable
  has_many :ratings, as :ratable

  validates :review_title, :review_content, :user_id, :film_id, { presence: true }

end
