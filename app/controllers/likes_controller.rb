class LikesController < ApplicationController
  before_action :authenticate_user!
  def save_like
      @like = Like.new(discussion_id: params[:discussion_id] , user_id: current_user.id)
      @discussion_id = params[:discussion_id]
      existing_like = Like.where(discussion_id: params[:discussion_id] , user_id: current_user.id)
         respond_to do |format|
          format.js {
              if existing_like.any?
                existing_like.first.destroy
                @success = false
              elsif @like.save
                @success = true
              else
                @success = false
              end
              @discussion_likes = Discussion.find(@discussion_id).total_likes_count
              render "discussions/like"
          }
      end
  end
end







