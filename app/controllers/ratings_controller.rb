class RatingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @rating = Rating.new
  end

  def create
    @rating = @rateable.ratings.new(rating_params)
    @rating.user = current_user
    if @rating.save
      if request.xhr?
        redirect_to @rateable
      else
        redirect_to @rateable
      end
    else
      redirect_to action: 'show', controller:'reviews' , id:params[:review][:id].to_i
    end
  end

  private

    def rating_params
      params.require(:rating).permit(:rating)
    end

end