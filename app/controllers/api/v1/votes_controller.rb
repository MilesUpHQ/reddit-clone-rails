class Api::V1::VotesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @vote = Vote.new(vote_params.merge(post: @post))

    if @vote.save 
      render json: @post.vote_count
    else
      render json: { error: @vote.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    @votes = Vote.all

    render json: @votes
  end
  
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
  end
  private

  def vote_params
    params.require(:vote).permit(:value, :account_id)
  end

end
