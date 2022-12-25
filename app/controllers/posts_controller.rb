class PostsController < ApplicationController
  before_action :authenticate_account!, except:  [ :index, :show ]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :increment_view_count]
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
  end

  def create
    @post = Post.new post_values
    @post.account_id = current_account.id

    if @post.save
      redirect_to community_path(@post.community_id)
    else
      render :new
    end
  end

  def edit

  end


  def update
    @community = Community.find(params[:community_id])
    if @community.posts.update(post_values)
      redirect_to community_post_path(@post)
    else
      render :edit
  end
end


def destroy
end
  private
  if @post
    @post.destroy
    redirect_to root_path
  end

  def increment_view_count
    @post.view_count += 1
    @post.save
  end

  def set_post
    @post = Post.includes(:comments).find(params[:id])
  end

  def auth_subscriber
    unless Subscription.where(community_id: params[:community_id], account_id: current_account.id).any?
      redirect_to root_path, flash: { danger: "You are not authorized to view this page" }
    end
  end

  def post_values
    params.require(:post).permit(:title, :body, :community_id)
  end

  def find_my_communities
    @subscriptions = Subscription.where(account_id: current_account.id)
    @my_communities = []
    @subscriptions.each do |subscription|
      @my_communities << Community.find(subscription.community_id)
    end
  end

end
