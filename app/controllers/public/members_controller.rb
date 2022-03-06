class Public::MembersController < ApplicationController

  def show
    @member = current_member
    #@thanks_project = Thanks.where(member_id: @member.id).all
  end

  def edit
  end

  def update
  end
end
