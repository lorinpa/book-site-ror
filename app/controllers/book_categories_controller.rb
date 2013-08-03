class BookCategoriesController < ApplicationController
    before_action :set_book_category, only: [:show, :edit, :update, :destroy]
    respond_to :js, :html
    rescue_from ActiveRecord::RecordNotUnique, :with => :unique_record_handler


    # GET /book_categories
    # GET /book_categories.json
    def index
        @book_categories = BookCategory.all.includes( :book,  :category)
    end

    # GET /book_categories/1
    # GET /book_categories/1.json
    def show
        @book_categories = BookCategory.find(params[:id], :include => :book, :include => :category)
    end

    # GET /book_categories/new
    def new
        @book_category = BookCategory.new
    end

    # GET /book_categories/1/edit
    def edit
    end

    # POST /book_categories
    # POST /book_categories.json
    def create
        @book_category = BookCategory.new(book_category_params)


        respond_to do |format|
          if @book_category.save
            format.html { redirect_to @book_category, notice: 'Book category was successfully created.' }
            format.json { render action: 'show', status: :created, location: @book_category }
          else
            format.html { render action: 'new' }
            format.json { render json: @book_category.errors, status: :unprocessable_entity }
          end
        end
    end

    # PATCH/PUT /book_categories/1
    # PATCH/PUT /book_categories/1.json
    def update
    respond_to do |format|
      if @book_category.update(book_category_params)
        format.html { redirect_to @book_category, notice: 'Book category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @book_category.errors, status: :unprocessable_entity }
      end
    end
    end

    # DELETE /book_categories/1
    # DELETE /book_categories/1.json
    def destroy
    @book_category.destroy
    respond_to do |format|
      format.html { redirect_to book_categories_url }
      format.json { head :no_content }
    end
    end

    def  books_by_category
        @book_categories =  BookCategory.includes(:book).select("book.title, book.author.last_name, book.author.first_name, book.reviews.count").where("book_categories.category_id = ? ", params[:category_id])
        @category = Category.select("title").where("categories.id = ?", params[:category_id]).distinct.first
        @category_title = @category.title
        {:book_categories => @book_categories, :category_title => @category_title}
    end

    def categories_by_book
        @book_categories =  BookCategory.includes(:category).select("category.title").where("book_categories.book_id = ? ", params[:book_id])
        @book = Book.includes(:author).where("id = ?", params[:book_id]).distinct.first
        {:book_categories => @book_categories, :book => @book}
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_category
      @book_category = BookCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_category_params
      params[:book_category].permit(:book_id, :category_id)
    end
    
    def unique_record_handler(exception)
        redirect_to new_book_category_url, :duplicate_record_exception => "Book Category already exists! can not add a duplicate."
    end  


end
