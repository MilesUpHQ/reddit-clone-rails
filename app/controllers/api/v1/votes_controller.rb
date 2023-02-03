class Api::V1::VotesController < ApplicationController


  def create
    @post = Post.find(params[:post_id])
    @vote = Vote.new(vote_params.merge(post: @post, account: current_account))

    if @vote.save
      render json: @post.votes
    else
      render json: { error: @vote.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    @votes = Vote.all

    render json: @votes
  end

  private

  def vote_params
    params.require(:vote).permit(:value)
  end

end
