class CommentsController < ApplicationController

  def new
    @user = current_user
    @category = Category.find(params[:project_id])
    @project = Project.find(params[:project_id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @category = Category.find(params[:project_id])
    @project = Project.find(params[:project_id])
    @comment = @project.comments.new(comment_params)
    @user.comments.push(@comment)
    if @comment.save
      redirect_to category_project_path(@category, @project)
    else
      render :new
    end
  end

  private
	def comment_params
		params.require(:comment).permit(:body)
	end

end
