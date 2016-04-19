class FilmsController < ApplicationController

  def show
    @film = Film.find(params[:id])
    @review = Review.new
    @comment = Comment.new
  end

end