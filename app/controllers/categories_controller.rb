class CategoriesController < ApplicationController
  def index
    @categories = Category.take(6)
    if params[:search]
      @films = Film.search(params[:search]).order("created_at DESC")
    else
      @films = Film.all.order('created_at DESC')
    end
  end

  def show
    @category =  Category.find(params[:id])
  end

end
