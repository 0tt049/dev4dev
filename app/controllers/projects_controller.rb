class ProjectsController < ApplicationController
  before_action :set_project, only: :destroy
  before_action :set_user, only: %i[new create]

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice: 'Your project was successfully created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to '/', status: :see_other
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
