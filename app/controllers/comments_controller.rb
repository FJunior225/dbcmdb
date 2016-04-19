class CommentsController < ApplicationController

  def create
    @review = Review.find_by(id: params[:id])
    @comment = @review.comments.new(comment_params)
    if @comment.save
      if request.xhr?
        render '_comments', layout: false, locals: {comment: @comment}
      else
        redirect_to action: 'show', controller:'reviews' , id:params[:review][:id].to_i
      end
    else
      redirect_to action: 'show', controller:'reviews' , id:params[:review][:id].to_i
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_body, :commentable_id, :commentable_type, :user_id, :review_id)
  end
end
