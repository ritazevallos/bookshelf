class BooksController < ApplicationController
	def create
		@categories = Category.all
		@category = Category.find(params[:category_id])
		@book = @category.books.create(book_params)
		@page = MetaInspector.new(@book.link)
		@book.title = @page.title.strip
		@book.description = @page.description.strip
		respond_to do |format|
			if @book.save
	          format.html {redirect_to categories_path, notice: 'Book created.'}
	    		format.js
	    	else
	    		format.html{redirect_to categories_path, notice: 'Error.'}
	    		format.js
	    	end
      	end
	end

	def edit
	  	@book = Book.find(params[:id])
		respond_to do |format|
		  	format.html
		  	format.js
	  	end
	end

	def update
		@categories = Category.all
		@books = Book.all
		@book = Book.find(params[:id])
		respond_to do |format|
			if @book.update_attributes(book_edit_params)
				format.html {redirect_to categories_path, notice: 'Book edited.'}
				format.js
			else
				format.html {redirect_to categories_path, notice: 'Error.'}
				format.js
			end
		end
	end

	def destroy
		@categories = Category.all
	    @book = Book.find(params[:id])
	    respond_to do |format|
	    	if @book.destroy
	    		format.html {redirect_to categories_path, notice: 'Book deleted.'}
	    		format.js
	    	else
	    		format.html{redirect_to categories_path, notice: 'Error.'}
	    		format.js
	    	end
	    end
	end

	def index
		@book = Book.new
		@books = Book.all
	end

	private

	def book_params
		params.require(:book).permit(:link)
	end

	def book_edit_params
		params.require(:book).permit(:title,:link,:description)
	end
end
