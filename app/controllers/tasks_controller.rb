class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    def index
        @tasks = Task.all
      end
    
      def show
      end
    
      def new
        @task = Task.new
      end
    
      def create
        @task = Task.new(task_params)
        if @task.save
          respond_to do |format|
            format.html { redirect_to tasks_path, notice: "task was successfully created." }
            format.turbo_stream
          end
        else
          render :new, status: :unprocessable_entity
        end
      end 
    
      def edit
      end
    
      def update
        if @task.update(task_params)
          redirect_to tasks_path, notice: "task was successfully updated."
        else
          render :edit,status: :unprocessable_entity
        end
      end
    
      def destroy
        @task.destroy
        respond_to do |format|
          format.html { redirect_to tasks_path, notice: "task was successfully destroyed." }
          format.turbo_stream
        end
      end
    
      private
    
      def set_task
        @task = Task.find(params[:id])
      end
    
      def task_params
        params.require(:task).permit(:task)
      end
end
