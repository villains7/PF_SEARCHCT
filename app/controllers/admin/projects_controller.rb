class Admin::ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @member = @project.member_id
  end
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to admin_top_path
    flash[:success] = "案件削除が完了しました。"
  end
end
