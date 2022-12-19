class PublicController < ApplicationController

  def index
    @communities = Community.all.order("post_count_this_week desc").limit(5)
    @posts = Post.order(created_at: :desc).page(params[:page]).per 5
  end
  def profile
    @profile = Account.find_by_username params[:username]
    @posts = @profile.posts
  end
end
