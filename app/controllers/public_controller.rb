class PublicController < ApplicationController
  include SavePostHelper
  before_action :saved_posts, only: [:profile]
  before_action :subscriptions, only: [:profile]
  def index
    @communities = Community.order("post_count_this_week desc").limit(5)
    @posts = Post.order(created_at: :desc).page(params[:page]).per 5
    @top_posts = Post.order(view_count: :desc).page(params[:page]).per 5
  end
  
  def profile
    redirect_to new_account_session_path  unless account_signed_in?
    community_list
    @community = Community.find(@subscriptions.pluck(:community_id))
    @my_communities = account_signed_in? ? Community.where(account_id: current_account.id) : []
    @profile = Account.find_by_username params[:username]
    @posts = @profile.posts
    @my_comments = Comment.where(account_id: @profile.id)
    @my_posts = my_posts
    @hot_myposts = hot_posts.page(params[:page]).per 5
   end

  def my_comments
    @my_comments = Comment.where(account_id: current_account.id).pluck(:message).with_rich_text_content.order(created_at: :asc)
  end

  private
  def saved_posts
    @saved_posts =  account_signed_in? ? SavePost.where(account_id: current_account.id) : []
  end

  def subscriptions
    @subscriptions = account_signed_in? ? Subscription.where(account_id: current_account.id) : []
  end

  def my_posts
    Post.where(account_id: @profile.id)
  end
  
  def hot_posts
    Post.where(account_id: @profile.id).order(view_count: :desc)
  end
  
end

