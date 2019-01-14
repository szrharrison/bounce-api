class Api::V1::ProjectsController < ApplicationController
  def create
    project = Project.create(*project_params, user: @current_account.user)
    render json: {project: project}
  end

  def update
    project = Project.find(params.require(:id))
    if project.user.id == @current_account.user.id
      project.update(project_params)
      render json: {project: project}
    end
  end

  def index
    projects = Project.find_by(user_id: @current_account.user.id)
    render json: {projects: projects}
  end

  def show
    project = Project.find(params.require(:id))
    if project.user.id == @current_account.user.id
      render json: {project: project}
    end
  end

  def delete
    project = Project.find(params.require(:id))
    if project.user.id == @current_account.user.id
      project.destroy
    end
  end

  private

    def project_params
      params.require(:project).permit(:id, :user_id, :urgency, :importance, :name, :due_date)
    end
end