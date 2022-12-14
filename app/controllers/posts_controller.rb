class PostsController < ApplicationController
  before_action :authenticate_account!, except:  [ :index, :show ]
  before_action :set_community, only: [:show, :create, :edit, :update, :destroy, :increment_view_count ,:close]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :increment_view_count ,:close]
  before_action :set_draft, only: [:new, :edit, :update]
  before_action :find_my_communities, only: [:new, :create, :edit, :update]
  before_action :community_list
  before_action :cancel_check ,only: [:update]
  def index
    @posts = Post.all
  end
  def show
    increment_view_count
    @comment = Comment.new
    @categories = ReportCategory.all
    @report = Report.new
  end
  def new
    @post = Post.new
    @community = Community.find_by(params[:id])
  end
  def create
    @drafts = Post.drafts(current_account.id)
    @post = Post.new post_values
    @post.account_id = current_account.id
    @post.is_drafted = params[:commit] == "Publish" ? false : true
    if @post.save
      if @post.is_drafted?
        flash[:notice] = t("draft.success")
        redirect_to new_community_post_path(@post.community_id)
      else
        flash[:notice] = t("post.success")
        redirect_to community_path(@post.community_id)
      end
    else
    flash[:alert] = t("form.required")
      render :new
    end
  end
  def edit
    @post = Post.find(params[:id])
  end
def update
  @post = Post.find(params[:id])
  @post.community_id = params[:community_id]
  @post.is_drafted = params[:commit] == "Publish" ? false : true
  if @post.update(post_values)
    if @post.is_drafted
      flash[:notice] = t("draft.success")
      redirect_back(fallback_location: edit_community_post_path)
    else
      flash[:notice] = t("post.updated")
      redirect_to community_post_path(@post.community_id)
    end
  else
      flash[:alert] =  t("form.required")
      render :edit
  end
end
def close
  @post.update(closed: "true")
  flash[:notice] = t("post.close")
  redirect_back(fallback_location: root_path)
end
def my_posts
  @my_posts = Post.where(account_id: current_account.id)
end
def destroy
  if @post.destroy
    flash[:notice] = t("post.destroy")
    redirect_to root_path
  end
end
private
  def increment_view_count
    @post.view_count += 1
    @post.save
  end
  def set_community
    @community = Community.friendly.find(params[:community_id])
  end
  def set_post
    @post = Post.includes(:comments).find(params[:id])
  end
  def set_draft
    @drafts = Post.drafts(current_account.id).order(created_at: :desc)
  end
  def auth_subscriber
    unless Subscription.where(community_id: params[:community_id], account_id: current_account.id).any?
      redirect_to root_path, flash: { danger: "You are not authorized to view this page" }
    end
  end
  def post_values
      params.require(:post).permit(:title, :body , :oc , :spoiler , :nsfw, :saved, :is_drafted, :closed, :community_id,  images: [])
  end
  def find_my_communities
    @subscriptions = Subscription.where(account_id: current_account.id).pluck(:community_id)
    @my_communities = Community.find(@subscriptions)
  end
  def cancel_check
    if  params[:commit] == "Cancel"
      redirect_to community_post_path(@post.community_id)
    end
  end
end
