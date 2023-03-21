class TasksController < ApplicationController
    before_action :get_category

    def index
        @tasks = @category.tasks
    end

    def show
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
    end

    def update
    end

    def delete
    end

    private

    def get_category
        @category = Category.find(params[:category_id])
    end

    def tasks_params
        params.require(:task).permit(:task, :quadrant)
    end
end