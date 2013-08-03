class AuthorsController < ApplicationController
    #http_basic_authenticate_with name: "dhh", password: "secret", except: :index
    before_action :set_author, only: [:show, :edit, :update, :destroy]
    rescue_from ActiveRecord::RecordNotUnique, :with => :unique_record_handler
    
    def index
        @authors = Author.includes(:books)
    end

    def mob_index
        @authors = Author.includes(:books)
        render layout: "mob-application"
    end

    def show
        @author = Author.find(params[:id])
    end

    def new
        @author = Author.new
    end

    def create
        @author = Author.new(author_params)

        respond_to do |format|
          if @author.save
            format.html { redirect_to @author, notice: 'Author was successfully created.' }
            format.json { render action: 'show', status: :created, location: @author }
          else
            format.html { render action: 'new' }
            format.json { render json: @author.errors, status: :unprocessable_entity }
          end
        end
    end

    def update
        respond_to do |format|
          if @author.update(author_params)
            format.html { redirect_to @author, notice: 'Author was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: 'edit' }
            format.json { render json: @author.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        @author.destroy
        respond_to do |format|
          format.html { redirect_to authors_url }
          format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_author
          @author = Author.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def author_params
          params[:author].permit(:first_name, :last_name)
        end

        def unique_record_handler(exception)
            redirect_to new_author_url, :duplicate_record_exception => "Author already exists! can not add a duplicate."
        end  
end
