class TasksController < ApplicationController
    before_action :get_category

    def index
        @tasks = @category.tasks
    end

    def show
        @tasks = @category.tasks.find_by(quadrant: params[:quadrant])
    end

    def new
        @task = @category.tasks.build
    end

    def create
        @task = @category.tasks.build(tasks_params)

        if @task.save
            redirect_to categories_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @task = @category.tasks.find(params[:id])
    end

    def update
        @task = @category.tasks.find(params[:id])
        
        if @task.update(tasks_params)
            redirect_to categories_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @task = @category.tasks.find(params[:id])
        @task.destroy
        redirect_to categories_path
    end

    private

    def get_category
        @category = Category.find(params[:category_id])
    end

    def tasks_params
        params.require(:task).permit(:task, :quadrant)
    end
end