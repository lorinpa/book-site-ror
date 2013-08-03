class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]
    rescue_from ActiveRecord::RecordNotUnique, :with => :unique_record_handler

    def index
        @books = Book.all.includes(:author, :reviews)
    end

    def mob_index
        @books = Book.all.includes(:author, :reviews)
        render action: "index", layout: "mob-application"
    end

    def show
         @books = Book.includes(:author).where("id = ?", params[:id])
    end
    
    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)

        respond_to do |format|
          if @book.save
            format.html { redirect_to @book, notice: 'Book was successfully created.' }
            format.json { render action: 'show', status: :created, location: @book }
          else
            format.html { render action: 'new' }
            format.json { render json: @book.errors, status: :unprocessable_entity }
          end
        end
    end

    def update
        respond_to do |format|
          if @book.update(book_params)
            format.html { redirect_to @book, notice: 'Book was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: 'edit' }
            format.json { render json: @book.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        @book.destroy
        respond_to do |format|
          format.html { redirect_to books_url }
          format.json { head :no_content }
        end
    end

    def books_by_author 
        @books = Book.includes(:reviews,:book_categories).where("author_id = ?", params[:author_id])
        @author = Author.where("id = ?", params[:author_id])
        @author = @author.first
        {books: @books, author: @author}
    end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params[:book].permit(:title, :author_id)
    end

    def unique_record_handler(exception)
        redirect_to new_book_url, :duplicate_record_exception => "Book/Author already exists! Can not add a duplicate."
    end  
end
