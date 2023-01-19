class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build comment_params
    @comment.account_id = current_account.id
    if @comment.save
      flash[:notice] = t("comment.create")
    else
      flash[:alert] = t("comment.empty")
    end
    redirect_to community_post_path(@comment.post.community_id, @comment.post)
  end

  def comment_params
    params.require(:comment).permit(:message, :replies, :parent, :parent_id)
  end

end
