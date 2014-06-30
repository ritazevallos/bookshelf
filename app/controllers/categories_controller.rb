class CategoriesController < ApplicationController
  def index
  	@categories = Category.all
  	@category = Category.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @category = Category.new
    respond_to do |format|
      format.html {redirect_to @categories} #todo redirect to new page
      format.js
    end
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        @categories = Category.all
        format.html {redirect_to @categories, notice: 'Category created.'}
        format.js
      else
        format.html {redirect_to @categories, notice: 'Error.'} #todo log error
        format.js
      end
    end
  end

  def destroy
    @categories = Category.all
    @category = Category.find(params[:id])
    respond_to do |format|
      if @category.destroy
        format.html {redirect_to categories_path, notice: 'Category deleted.'}
        format.js
      else
        format.html {redirect_to categories_path, notice: 'Error.'} #todo log error
        format.js
      end
    end
  end

	private

	def category_params
		params.require(:category).permit(:name)
	end
end
