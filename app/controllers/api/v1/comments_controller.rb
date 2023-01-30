class Api::V1::CommentsController < ApplicationController
  before_action :set_post
  
  def create
    @comment = @post.comments.create(comment_params)

    if @comment.save!
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:account_id, :post_id, :message, :replies, :parent, :parent_id)
  end
end
