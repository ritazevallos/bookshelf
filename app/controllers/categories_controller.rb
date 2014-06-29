class CategoriesController < ApplicationController
  def index
  	@categories = Category.all
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)
  	@category.save
  	redirect_to categories_path
  end

  def show
  	@category = Category.find(params[:id])
  	@book = @category.books.build
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to categories_path
  end

	private

	def category_params
		params.require(:category).permit(:name)
	end
end
