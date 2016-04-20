class FilmsController < ApplicationController

<<<<<<< HEAD
	def index
		@films = Film.all
	end
	
  def show
    @film = Film.find(params[:id])
    @rating = Rating.new
    @review = Review.new
    @comment = Comment.new
  end
>>>>>>> master

end