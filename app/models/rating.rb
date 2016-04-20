class Rating < ActiveRecord::Base
	belongs_to :rateable, polymorphic: true
	belongs_to :user

	validates :rating, :user_id, { presence: true }
  validates_uniqueness_of :user, :scope => [:rateable_id, :rateable_type]

end