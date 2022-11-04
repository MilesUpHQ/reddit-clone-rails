class CommunitiesController < ApplicationController
  before_action :authenticate_account!, except:  [ :index, :show ]
  before_action :set_community, only: [:show, :edit,:update,:destroy]
  before_action :find_all_communities, only: [:index, :count_post_for_this_week]
  after_action :count_post_for_this_week, only: [:index]

  def index
    count_post_for_this_week
  end

  def show
    @posts = @community.posts.limit(20).sort_by{ |p| p.score }.reverse
    @subscriber_count = @community.subscribers.count
    @is_subscribed = account_signed_in? ? Subscription.where(community_id: @community.id, account_id: current_account.id).any? : false
    @subscription = Subscription.new
  end

  def new
    @community = Community.new
  end
  def edit

  end

  def create
    @community = Community.new community_values
    @community.account_id = current_account.id

    if @community.save
      redirect_to communities_path
    else
      render :new
    end
  end
  def update

    if @community.update(community_values)
      redirect_to @community
    else
      render :new

  end
end


def destroy
  @community.destroy if @community
  redirect_to communities_path
end

  private

  def set_community
    @community = Community.find(params[:id])
  end

  def find_all_communities
    @communities = Community.all
  end

  def community_values
    params.require(:community).permit(:name, :url, :summary, :rules, :profile_image, :cover_image)
  end

  def count_post_for_this_week
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
end
