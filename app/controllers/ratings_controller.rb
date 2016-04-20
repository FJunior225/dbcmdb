class RatingsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @rating = Rating.new
  end

  def create
    @rating = @rateable.ratings.new(rating_params)
    reviewer = Review.find_by(id: @rating.rateable_id).user
    unless current_user == reviewer
      @rating.user = current_user
      if @rating.save
        reviewer.trusted_user
        redirect_to @rateable
      else
        flash[:alert] = "You can only rate an item once!"
      end
    else
      flash[:alert] = "You cannot rate your own review!"
    end
  end

  private

    def rating_params
      params.require(:rating).permit(:rating)
    end

end