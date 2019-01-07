class TasksController < ApplicationController
  def create
    Task.create(task_params)
  end

  def index
    Task.find_by(user_id = params[:user_id])
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
  end

  def show
    Task.find(params[:id])
  end

  def delete
    task = Task.find(params[:id])
    task.destroy
  end

  private

    def task_params
      params.require(:task).permit(:name, :urgency, :importance, :easy_startable, :due_date, :project_id, :user_id)
    end
end