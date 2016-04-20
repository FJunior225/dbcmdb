class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      if request.xhr?
        render partial: '/comments/comments'
      else
        redirect_to @commentable
      end
    else
      redirect_to action: 'show', controller:'reviews' , id:params[:review][:id].to_i
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:comment_body)
    end
end
