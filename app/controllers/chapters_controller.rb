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
		if @chapter.isLink == true # if chapter type is a link
			@page = MetaInspector.new(@chapter.link, timeout: 10) #todo: check that we got a page
			@chapter.title = @page.title.strip
			@chapter.content = @page.description.strip
			# if chapter is not a link, then content would have been set by the form
		end
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
		params.require(:chapter).permit(:content, :link, :isLink)
	end

end
