class Films::RatingsController < RatingsController
  before_action :set_rateable

  private

    def set_rateable
      @rateable = Film.find(params[:film_id])
    end
end