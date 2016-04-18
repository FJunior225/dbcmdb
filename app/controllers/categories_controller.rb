class CategoriesController < ApplicationController

def index
  @categories = Category.take(6)
end

def show
  @category =  Category.find(params[:id])
end

end