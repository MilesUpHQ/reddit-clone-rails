class Api::V1::SavePostsController < ApplicationController
  
  def index
    def index
        @saved_posts = SavePost.includes(:account, :post)
        render json: @saved_posts, include: %i[account post]
      end
    
  end
end