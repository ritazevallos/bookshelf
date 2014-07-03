class ChaptersController < ApplicationController

	def new
		@book = Book.find(params[:book_id])
		respond_to do |format|
		  format.html {redirect_to categories_path}
		  format.js
		end
	end

	def create
		@book = Book.find(params[:book_id])
		@chapter = @book.chapters.build(chapter_params)
		respond_to do |format|
			if @chapter.save
	          format.html {redirect_to categories_path, notice: 'Chapter created.'}
	    		format.js
	    	else
	    		format.html{redirect_to categories_path, error: 'Error.'}
	    		format.js
	    	end
      	end
	end

	def edit
		@chapter = Chapter.find(params[:id])
		respond_to do |format|
		  	format.html
		  	format.js
	  	end
	end

	def update
		@chapter = Chapter.find(params[:id])
		respond_to do |format|
			if @chapter.update_attributes(chapter_params)
				format.html {redirect_to categories_path, notice: 'Chapter edited.'}
				format.js
			else
				format.html {redirect_to categories_path, notice: 'Error.'}
				format.js
			end
		end
	end

	def destroy
	    @chapter = Chapter.find(params[:id])
	    respond_to do |format|
	    	if @chapter.destroy
	    		format.html {redirect_to categories_path, notice: 'Chapter deleted.'}
	    		format.js
	    	else
	    		format.html{redirect_to categories_path, notice: 'Error.'}
	    		format.js
	    	end
	    end
	end

	private

	def chapter_params
		params.require(:chapter).permit(:content)
	end

end
