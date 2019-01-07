class ProjectsController < ApplicationController
  def create
    project = Project.new(project_params)
    project.save
  end

  def update
    project = Project.find(params[:id])
    project.update(project_params)
  end

  def index
    Project.find_by(user_id: project_params[:user_id])
  end

  def show
    Project.find(params[:id])
  end

  def delete
    project = Project.find(params[:id])
    project.destroy
  end

  private

  def project_params
    params.require(:project).permit(:user_id, :urgency, :importance, :name, :due_date)
  end
end