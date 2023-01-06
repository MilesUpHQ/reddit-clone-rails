class CommentsController < ApplicationController

  def create
    @comment = Comment.new comment_params
    if @comment.save
      flash[:notice] = "Comment Created Successfully"
    else
      flash[:alert] = "Empty Comments are not Accepted!"
    end
    redirect_to community_post_path(@comment.post.community_id, @comment.post)
  end

  def comment_params
    params.require(:comment).permit(:message, :post_id, :replies, :parent, :parent_id, :account_id)
  end

end
