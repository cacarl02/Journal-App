class CategoriesController < ApplicationController
    before_action :authenticate_user
    def index
        if session[:user_id]
            @user = User.find_by(id: session[:user_id])
        end
        @categories = Category.all
    end
    
    def new
        @category = Category.new
    end
    
    def show
        @category = Category.find(params[:id])
    end

    def create
        if session[:user_id]
            @user = User.find_by(id: session[:user_id])
        end
        @category = Category.new(category_params)
        @category.user_id = @user.id

        if @category.save
            redirect_to categories_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @category = Category.find(params[:id])
    end
    
    def update
        @category = Category.find(params[:id])
        if @category.update(category_params)
            redirect_to categories_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private

    def category_params
        params.require(:category).permit(:name)
    end
end