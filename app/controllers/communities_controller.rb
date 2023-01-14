class CommunitiesController < ApplicationController
  before_action :authenticate_account!, except:  [ :index]
  before_action :set_community, only: [:show, :edit, :update, :destroy, :mod, :check_if_banned]
  before_action :community_list
  before_action :check_if_banned, only: [:show]
  after_action :count_post_for_this_week, only: [:index]

  def index
    count_post_for_this_week
    @categories = Community::CATEGORIES
    if(params.has_key?(:category))
      @communities = Community.where(category: params[:category]).order(created_at: :desc).page(params[:page]).per 7
    else
      @communities = Community.order(created_at: :desc).page(params[:page]).per 7
    end
    @random_category_communities = Community.where(category: @categories.sample).order("post_count_this_week desc").limit(5)
  end

  def show
    @posts = @community.posts.limit(20).sort_by{ |p| p.score }.reverse
    @subscriber_count = @community.subscribers.count
    @subscribed = is_subscribed?
    @subscription = Subscription.new
  end

  def new
    @community = Community.new
  end

  def edit
  end

  def create
    @community = Community.new community_params
    @community.account_id = current_account.id
    @community.owner_id = current_account.id
    if @community.save
      Subscription.create!(community_id: @community.id, account_id: current_account.id)
      redirect_to communities_path, notice: t("community.success")
    else
      render :new, alert: t("form.required")
    end
  end

  def update
    if @community.update community_params
      redirect_to @community, notice: t("community.updated")
    else
      render :new, alert: t("form.required")
    end
  end

  def destroy
    @community.destroy if @community
    redirect_to communities_path, notice: t("community.destroy")
  end

  def mod
    unless @community.account_id == current_account.id
      redirect_back(fallback_location: root_path) and return
    end
    @banned_user = set_banned_user.order(created_at: :desc).page(params[:page]).per 5
    @username = Account.pluck(:username).sort
  end

  def search_suggestions
    communities = Community.where("name ILIKE ?", "%#{params[:q]}%").select(:id, :name)
    render json: communities
  end


  private
  def community_params
    params.require(:community).permit(:name, :url, :summary, :rules, :category, :profile_image, :cover_image)
  end

  def count_post_for_this_week
    @communities = Community.all
    @communities.each do |community|
      community.post_count_this_week = 0
      @posts = community.posts
      @posts.each do |post|
        if ((Time.now - post.updated_at).to_f / 1.day).floor < 7
          community.post_count_this_week += 1
        end
      end
      community.save
    end
  end

  def set_banned_user
    BannedUser.where(community_id: @community.id)
  end

  def check_if_banned
    banned_user = set_banned_user.find_by(account_id: current_account.id)
    unless banned_user.nil?
      redirect_to '/403'
    end
  end

end
