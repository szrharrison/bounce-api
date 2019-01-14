class Api::V1::TasksController < ApplicationController
  def create
    if params.require(:project_id)
      task = Task.create(*task_params, user: @current_account.user, project_id: params.require(:project_id))
    else
      task = Task.create(*task_params, user: @current_account.user)
    end
    render json: {task: task}
  end

  def index
    tasks = Task.find_by(user: @current_account.user)
    render json: {tasks: tasks}
  end

  def update
    task = Task.find(params.require(:id))
    if task.user.id == @current_account.user.id
      task.update(task_params)
      render json: {task: task}
    end
  end

  def show
    task = Task.find(params.require(:id))
    if task.user.id == @current_account.user.id
      render json: {task: task}
    end
  end

  def delete
    task = Task.find(params.require(:id))
    if task.user.id == @current_account.user.id
      task.destroy
    end
  end

  private

    def task_params
      params.require(:task).permit(:id, :name, :urgency, :importance, :easy_startable, :due_date)
    end
end