class PostsController < ApplicationController
  before_action :authenticate_account!, except:  [ :index, :show ]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :auth_subscriber, only: [:new]
  before_action :community_list
  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @community = Community.find(params[:community_id])
    @post = Post.new 
    @drafts = Post.order(created_at: :desc).page(params[:page]).per 5
  end

  def create
    @post = Post.new post_values
    @post.account_id = current_account.id
    @post.community_id = params[:community_id]
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
      @community = Community.find(params[:community_id])
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @community = Community.find(params[:community_id])
  end

  def draft 
    @drafts =  Post.order(created_at: :desc).page(params[:page]).per 7
  end 


  def update
    @post = Post.find(params[:id])
    @post.community_id = params[:community_id]
    @post.is_drafted = false
    if @post.update(post_values)
      if params[:commit] == "Publish"
        redirect_to community_path(@post.community_id)
      else 
        @post.is_drafted = true
        redirect_to draft_path
      end  
    else
      render :edit
    end

  end


def destroy
  if @post
    @post.destroy
    redirect_to root_path
  end
end


  private

  def set_post
    @post = Post.includes(:comments).find(params[:id])
  end

  def auth_subscriber
    unless Subscription.where(community_id: params[:community_id], account_id: current_account.id).any?
      redirect_to root_path, flash: { danger: "You are not authorized to view this page" }
    end
  end

  def post_values
    params.require(:post).permit(:title, :body, :is_drafted)
  end
end
