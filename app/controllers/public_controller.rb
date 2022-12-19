class PublicController < ApplicationController

  def index
    @communities = Community.order("post_count_this_week desc").limit(5)
    @posts = Post.limit(20).sort_by{ |p| p.score }.reverse
  end
  def profile
    @profile = Account.find_by_username params[:username]
    @posts = @profile.posts
  end
end
