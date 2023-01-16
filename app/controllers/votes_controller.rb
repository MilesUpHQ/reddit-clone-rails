class VotesController < ApplicationController
  def create
    post_id = params[:post_id]

    vote = Vote.new(
      post_id: params[:post_id],
      upvote: params[:upvote],
      account_id: current_account.id
    )
    existing_vote = Vote.where(account_id: current_account.id, post_id: post_id) 
    Vote.save_vote(vote, existing_vote)
    @new_vote = existing_vote.size > 1
    @post = Post.find(post_id)
    @is_upvote = params[:upvote]
    render "votes/create"
  end

  private

  def vote_params
    params.require(:vote).permit(:upvote, :post_id)
  end
end

