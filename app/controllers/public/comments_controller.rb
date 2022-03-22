class Public::CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @comment = current_member.comments.new(comment_params)
    @comment.project_id = @project.id
    @comment.save
    # app/views/comments/create.js.erbを参照する
  end

  def destroy
    @project = Project.find(params[:project_id])
    @comment = Comment.find_by(id: params[:id], project_id: params[:project_id])
    @comment.destroy
    # app/views/comments/destroy.js.erbを参照する
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
