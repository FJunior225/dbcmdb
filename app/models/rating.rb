class Rating < ActiveRecord::Base
	belongs_to :rateable, polymorphic: true
	belongs_to :user

	validates :rating, :user_id, { presence: true }


end