class RatingsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @rating = Rating.new
  end

  def create
    @rating = @rateable.ratings.new(rating_params)
    @rating.user = current_user
    reviewer = Review.find_by(id: @rating.rateable_id).user
    if request.xhr?
      if @rating.save
        reviewer.trusted_user
        { rating_counter: @rating.total_rating }.to_json
      else
        halt(401)
      end
    else
      if @rating.save
        reviewer.trusted_user
        redirect_to @rateable
      end
    end
  end

  private

    def rating_params
      params.require(:rating).permit(:rating)
    end

end