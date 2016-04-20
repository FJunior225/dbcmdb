class FilmsController < ApplicationController

  def show
    @film = Film.find(params[:id])
    @rating = Rating.new
    @review = Review.new
    @comment = Comment.new
  end

end