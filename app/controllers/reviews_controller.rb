class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = Review.new
  end

  def create
    @film = Film.find(params[:review][:film_id])
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save
      if request.xhr?
        render partial: "reviews/review", locals: {review: @review},layout: false

      else
        redirect_to action: 'show', controller:'films', id:params[:review][:film_id].to_i
      end
    else
      render action: 'show', controller:'films', id:params[:review][:film_id].to_i
    end
  end

  def edit
    @review = Review.find(params[:id])
    unless current_user == @review.user
      redirect_to(@review, notice: "You cannot edit this review!") and return
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
      flash[:success] = "Review updated!"
      redirect_to @review
    else
      @errors = @review.errors.full_messages
      flash[:danger] = "You did not enter a valid reponse!"
      render 'reviews/edit'
    end
  end

  def show
    @review = Review.find(params[:id])
    @comment = @review.comments.new
    @film = Film.find_by(id: @review.film_id)
    @rating = Rating.new
  end

  private

    def review_params
      params.require(:review).permit(:review_title, :review_content, :recommend, :user_id, :film_id)
    end


end