class BooksController < ApplicationController
	def create
		@category = Category.find(params[:category_id])
		@book = @category.books.create(book_params)
		page = MetaInspector.new(@book.link)
		@book.title = page.title.strip
		@book.description = page.description
		@book.save
		redirect_to categories_path
	end

	def destroy
	    Book.find(params[:id]).destroy
	    redirect_to categories_path
	end

	def index
		@book = Book.new
		@books = Book.all
	end

	private

	def book_params
		params.require(:book).permit(:link)
	end
end
