class Public::ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save
    redirect_to '/'#リダイレクト先検討
  end

  def index
    @projects = Project.all
  end

  def show
  end

  private
  def project_params
    params.require(:project).permit(:title, :caption, :region,  :year,  :month, :salesman,  :project_image)
  end
end
