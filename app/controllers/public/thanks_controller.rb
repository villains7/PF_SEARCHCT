class Public::ThanksController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    thanks = current_member.thanks.new(project_id: @project.id)
    thanks.save
    #app/views/thanks/create.js.erbを参照する
  end

  def destroy
    @project = Project.find(params[:project_id])
    thanks = current_member.thanks.find_by(project_id: @project.id)
    thanks.destroy
    #app/views/thanks/destroy.js.erbを参照する
  end
end
