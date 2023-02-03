class Api::V1::SavePostsController < ApplicationController
  
    def index
      account_id = params[:account_id]
      @saved_posts = SavePost.where(account_id: account_id).includes(:account, :post)
      render json: @saved_posts, include: %i[account post]
    end
  
    def create
      @saved_post = SavePost.new(save_post_params)
      if @saved_post.save
        render json: @saved_post, status: :created
      else
        render json: @saved_post.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      saved_post = SavePost.find_by(account_id: params[:account_id], post_id: params[:id])
      saved_post.destroy if saved_post.present?
    end 
  
    def save_post_params
      params.require(:save_post).permit(:account_id, :post_id)
    end
  
  end
  