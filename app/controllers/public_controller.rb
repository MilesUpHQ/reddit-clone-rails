class PublicController < ApplicationController
  include SavePostHelper

  def index
    @communities = Community.order("post_count_this_week desc").limit(5)
    @posts = Post.order(created_at: :desc).page(params[:page]).per 5
    @top_posts = Post.order(view_count: :desc).page(params[:page]).per 5
    @new_posts = Post.order(created_at: :desc).page(params[:page]).per 5
    @hot_posts = Post.order(view_count: :desc).page(params[:page]).per 5
  end
  
  def profile
    redirect_to new_account_session_path  unless account_signed_in?
    community_list
    @saved_posts =  account_signed_in? ? SavePost.where(account_id: current_account.id) : []
    @subscriptions = account_signed_in? ? Subscription.where(account_id: current_account.id) : []
    @community = Community.find(@subscriptions.pluck(:community_id))
    @my_communities = account_signed_in? ? Community.where(account_id: current_account.id) : []
    @profile = Account.find_by_username params[:username]
    @posts = @profile.posts
    @my_comments = Comment.where(account_id: @profile.id)
    @my_posts = Post.where(account_id: @profile.id).page(params[:page]).per 5
    @hot_myposts = Post.where(account_id: @profile.id).order(view_count: :desc).page(params[:page]).per 5
    @top_myposts = Post.where(account_id: @profile.id).order(view_count: :desc).page(params[:page]).per 5
    @new_myposts = Post.where(account_id: @profile.id).order(created_at: :desc).page(params[:page]).per 5
  end

  def my_comments
    @my_comments = Comment.where(account_id: current_account.id).pluck(:message).with_rich_text_content.order(created_at: :asc)
  end
end

