class Public::ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
     redirect_to '/'#リダイレクト先検討
    else
      render :new
    end
  end

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @comment = Comment.new
  end

  private
  def project_params
    params.require(:project).permit(:title, :caption, :region,  :year,  :month, :salesman,  :project_image)
  end
end
