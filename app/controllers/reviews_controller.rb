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

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
      flash[:success] = "Review updated!"
      redirect_to @review
    else
      @errors = @review.errors.full_messages
      flash[:error] = "You did not enter a valid reponse!"
      render 'reviews/edit'
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