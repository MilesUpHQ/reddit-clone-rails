class Api::V1::CommentsController < ApplicationController
  before_action :set_post
  
  def create
    account = Account.find_by(id: params[:account_id])
    @comment = @post.comments.create(comment_params)
    @comment.account = account
    if @comment.save!
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def index

    @comments = @post.comments
    render json: @comments, include: [:post, :account]
    
  end

  private

  def set_post
    @post = Post.includes(:account).find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:message, :replies, :parent, :parent_id)
  end
end
