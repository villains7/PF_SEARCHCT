class Public::MembersController < ApplicationController
  before_action :authenticate_member!
  before_action :ensure_correct_member, only: [:edit, :update]
  correct
  def show
    @member = Member.find(params[:id])
    @projects = @member.projects
    @thanks_projects = @member.thanks_projects
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to member_path(@member)
    flash[:notice] = "情報を更新しました。"
  end

  private

  def member_params
    params.require(:member).permit(:last_name, :first_name, :email, :region, :section, :carrer, :year, :month, :profile_image, :word)
  end

  def ensure_correct_member
    @member = Member.find(params[:id])
    unless @member == current_member
      redirect_to member_path(current_member)
      flash[:alert] = "権限がありません"
    end
  end
end
