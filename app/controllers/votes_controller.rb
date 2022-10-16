class VotesController < ApplicationController
  def create
    discussion_id = params[:vote][:discussion_id]
    vote = Vote.new( vote_params)
    vote.user_id = current_user.id

    existing_vote = Vote.where(user_id: current_user.id, discussion_id: discussion_id)

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

        @discussion = Discussion.find(discussion_id)
        @total_upvotes = @discussion.upvotes
        @total_downvotes = @discussion.downvotes
      end

      render "votes/create"
      }
    end
  end

  def vote_params
    params.require(:vote).permit(:upvote, :discussion_id)
  end
end
