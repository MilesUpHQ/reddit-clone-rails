class CommentsController < ApplicationController

  def create
    @comment = Comment.new comment_params  
    @comment.account_id = current_account.id
    if @comment.save
      redirect_to community_post_path(@comment.post_id, @comment.post), flash: {success: "comment was created successfully!" }
    else
      redirect_to community_post_path(@comment.post_id, @comment.post), flash: { danger: "comment was not saved!" }
   end
  end

  def comment_params
    params.require(:comment).permit(:message, :post_id, :replies, :parent, :parent_id)
  end

end