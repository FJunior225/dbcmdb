class Rating < ActiveRecord::Base
	belongs_to :rateable, polymorphic: true
	belongs_to :user

	validates :rating, :user_id, { presence: true }
  validates_uniqueness_of :user, :scope => [:votable_id, :votable_type]
  # validates_uniqueness_of :rateable_id, :rateable_type, { scope: :user_id }

  # validate :unique_rate


  # def unique_rate()
  #   if Rating.where(user: current_user, rateable_id: self.rateable_id, rateable_type: self.rateable_type)
  #     errors.add(:rateable_id, "Can't rate more than once!")
  #   end
  # end

end