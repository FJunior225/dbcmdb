class FilmsController < ApplicationController

def show
  @film = Film.find(params[:id])
  @review = Review.new
end

end