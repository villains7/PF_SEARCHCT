class Public::CommentsController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @comment = current_member.comments.new(comment_params)
    @comment.project_id = @project.id
    @comment.save
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
