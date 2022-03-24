class Public::ProjectsController < ApplicationController
  before_action :authenticate_member!

  def index
    # トップページに案件閲覧数ランキングを表示
    # joinsでプロジェクトとビューカウントテーブルを内部結合。
    # groupメソッドでレコードをまとめる。その後member_idがいくつあるか数えてランキング化。
    @projects = Project.joins(:view_counts).group(:project_id).order('count(projects.member_id) desc').limit(5)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.member_id = current_member.id
    if @project.save
      redirect_to project_path(@project)
      flash[:success] = "案件登録が完了しました。"
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
    # 閲覧数表示のため以下を記載
    unless ViewCount.find_by(member_id: current_member.id, project_id: @project.id)
      current_member.view_counts.create(project_id: @project.id)
    end
    @member = @project.member_id
    @comment = Comment.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to project_path(@project)
    flash[:notice] = "更新が完了しました。"
  end

  private

  def project_params
    params.require(:project).permit(:title, :customer, :caption, :region, :start_year, :start_month, :start_day, :end_year, :end_month, :end_day, :vehicle_type, :lease_type, :body_shop, :salesman, :registration_number, :body_number, :insurance, :project_image, tag_ids: [])
  end
end
