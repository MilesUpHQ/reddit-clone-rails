class CommentsController < ApplicationController

  def create
    @comment = Comment.new comment_params
    @comment.save
    redirect_to post_path(@comment.post_id, @comment.post)
  end

  def comment_params
    params.require(:comment).permit(:message, :post_id, :replies, :parent, :parent_id, :account_id)
  end

end
