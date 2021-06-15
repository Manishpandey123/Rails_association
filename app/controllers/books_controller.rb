class BooksController < ApplicationController
    def index
        @books = Book.all
      end

    def show
        set_project
    end

    def new
        @book = Book.new
    end

    def edit
        set_project
    end

    def update
        set_project
            if  @book.update(project_params)
                redirect_to books_path
            else
                render :edit
            end
    end

    def create
        @book = Book.new(project_params)
        if @book.save
            redirect_to books_path
        else
            render :new
        end
    end

    def destroy
        set_project
        if @book.destroy
            redirect_to books_path
        end
    end

    private

    def set_project
        @book = Book.find(params[:id])
    end

    def project_params
        params.require(:book).permit(:topic, :author_id)
    end 
end
