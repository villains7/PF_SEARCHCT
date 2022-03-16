class Public::MembersController < ApplicationController
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
  end

  private

  def member_params
    params.require(:member).permit(:last_name, :first_name, :email, :region, :section, :carrer, :year, :month, :profile_image)
  end
end
