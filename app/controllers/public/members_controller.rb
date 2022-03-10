class Public::MembersController < ApplicationController

  def show
    @member = current_member
    @projects = @member.projects
  end

  def edit
  end

  def update
  end
end
