class RatingsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @rating = Rating.new
  end

  def create
    @rating = @rateable.ratings.new(rating_params)
    @review = Review.find_by(id: @rating.rateable_id)
    reviewer = Review.find_by(id: @rating.rateable_id).user
    unless current_user == reviewer
      @rating.user = current_user
      if @rating.save
        reviewer.trusted_user
        flash[:success] = "You've successfully rated this!"
        redirect_to @rateable
      else
        flash[:danger] = "You can only rate an item once!"
        redirect_to @rateable
      end
    else
      flash[:danger] = "You cannot rate your own review!"
      redirect_to @rateable
    end
  end

  private

    def rating_params
      params.require(:rating).permit(:rating)
    end

end