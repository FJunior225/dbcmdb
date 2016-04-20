class Reviews::RatingsController < RatingsController
  before_action :set_rateable

  private

    def set_rateable
      @rateable = Review.find(params[:review_id])
    end
end