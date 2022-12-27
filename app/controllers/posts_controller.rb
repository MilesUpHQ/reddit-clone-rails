class PostsController < ApplicationController
  before_action :authenticate_account!, except:  [ :index, :show ]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :increment_view_count ,:close]
  before_action :find_my_communities, only: [:new, :create, :edit, :update]
  before_action :community_list
  def index
    @posts = Post.all
  end

  def show
    increment_view_count
    @comment = Comment.new
  end

  def new
    @post = Post.new 
    @drafts = Post.order(created_at: :desc).page(params[:page]).per 5
  end

  def create
    @drafts = Post.all
    @post = Post.new post_values
    @post.account_id = current_account.id
    if @post.save
      if params[:commit] == "Publish"
        @post.is_drafted = false
        @post.save
        redirect_to community_path(@post.community_id)
      else
        @post.is_drafted = true
        @post.save
        redirect_to draft_path
      end
    else
      render :new
    end
  end

  def edit
  end


  def draft
    @drafts =  Post.order(created_at: :desc).page(params[:page]).per 7
  end

  def update
    if @post.update(post_values)
      if params[:commit] == "Publish"
        redirect_to root_path
      else
        @post.is_drafted = true
        redirect_to draft_path
      end
    else
      render :edit
    end
  end

  def save
    @post = Post.find(params[:id])
    @post.update(saved: true)
    redirect_back(fallback_location: root_path)
  end

  def unsave
    @post = Post.find(params[:id])
    @post.update(saved: false)
    redirect_back(fallback_location: root_path)
  end


  def saved_posts
    @saved_posts=Post.where(saved: true)
  end

  def close
    @post.update(closed: "true")
  end

  def destroy
    if @post
      @post.destroy
      redirect_to root_path
    end
  end

  private
  def increment_view_count
    @post.view_count += 1
    @post.save
  end

  def set_post
    @post = Post.friendly.includes(:comments).find(params[:id])
  end

  def auth_subscriber
    unless Subscription.where(community_id: params[:community_id], account_id: current_account.id).any?
      redirect_to root_path, flash: { danger: "You are not authorized to view this page" }
    end
  end

  def post_values
    params.require(:post).permit(:title, :body, :saved, :is_drafted, :closed, :community_id)
  end

  def find_my_communities
    @subscriptions = Subscription.where(account_id: current_account.id)
    @my_communities = []
    @subscriptions.each do |subscription|
      @my_communities << Community.find(subscription.community_id)
    end
  end
end