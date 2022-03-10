class Public::MembersController < ApplicationController

  def show
    @member = current_member
    @projects = @member.projects
  end

  def thanks
    thanks = Thank.where(member_id: current_member.id).pluck(:project_id)
    @thanks_project = Project.find(thanks)
  end

  def edit
  end

  def update
  end


end
