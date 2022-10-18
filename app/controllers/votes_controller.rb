class VotesController < ApplicationController
  # before_action :authenticate_user!
  def create
    # discussion_id = params[:vote][:discussion_id]
    discussion_id = params[:discussion_id]
    vote = Vote.new     #( vote_params)
    vote.discussion_id = params[:discussion_id]
    vote.upvote = params[:upvote]
    vote.user_id = current_user.id

    existing_vote = Vote.where(user_id: current_user.id, discussion_id: discussion_id)
    @new_vote = existing_vote.size > 1

    respond_to do |format|
      format.js {
      if existing_vote.size > 0
        existing_vote.first.destroy
      else
        if vote.save
          @success = true
        else
          @success = false
        end
        # @total_upvotes = @discussion.upvotes
        # @total_downvotes = @discussion.downvotes
      end
      @discussion = Discussion.find(discussion_id)
      @is_upvote = params[:upvote]
      render "create"
      }
    end
  end

  def vote_params
    params.require(:vote).permit(:upvote, :discussion_id)
  end
end
