class Public::MembersController < ApplicationController

  def show
    @member = Member.find(params[:id])
    @projects = @member.projects
    @thanks_projects = @member.thanks_projects
  end

  def edit
  end

  def update
  end


end
