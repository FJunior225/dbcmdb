class ReviewsController < ApplicationController

  def new
    @film = Film.find(params[:id])
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to action: 'show', controller:'toilets' , id:params[:review][:film_id].to_i
    else
      flash.now[:danger] = 'You must enter all fields and be logged in to post a review'
      render 'new'
    end
  end

  def show
    @reviews = Review.paginate(:page => params[:page])
  end

  private

  def review_params
    params.require(:review).permit(:review_title, :review_content, :recommend, :user_id, :film_id)
  end


end