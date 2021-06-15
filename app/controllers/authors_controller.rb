class AuthorsController < ApplicationController
    def index
        @authors = Author.all
      end

    def show
        set_project
    end

    def new
        @author = Author.new
    end

    def edit
        set_project
    end

    def update
        set_project
            if  @author.update(project_params)
                redirect_to authors_path
            else
                render :edit
            end
    end

    def create
        @author = Author.new(project_params)
        if @author.save
            redirect_to authors_path
        else
            render :new
        end
    end

    def destroy
        set_project
        if @author.destroy
            redirect_to authors_path
        end
    end

    private

    def set_project
        @author = Author.find(params[:id])
    end

    def project_params
        params.require(:author).permit(:name, :age)
    end
end
