class Api::V1::CommunitiesController < ApplicationController
  # before_action :authenticate_account!, except: [:index]
  before_action :set_community, only: %i[show update destroy]

  # GET /communities
  def index
    @communities = Community.all

    render json: @communities
  end

  # GET /communities/1
  def show
    check_if_banned
    render json: @community, include: %i[posts account subscriptions]
  end

  # POST /communities
  def create
    @community = Community.new(community_params)

    if @community.save
      render json: @community, status: :created
    else
      render json: @community.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /communities/1
  def update
    if @community.update(community_params)
      render json: @community
    else
      render json: @community.errors, status: :unprocessable_entity
    end
  end

  def joined_account_community
    ids = Subscription.where(community_id: params[:community_id]).pluck(:account_id)
    @joined_accounts = Account.where(id: ids).where('username LIKE ?', "%#{params[:q]}%").select(:id, :username)
    render json: @joined_accounts
  end

  def search_suggestions
    communities = Community.where('name LIKE ?', "%#{params[:q]}%").select(:id, :name)
    render json: { options: communities }
  end

  # DELETE /communities/1
  def destroy
    @community.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_community
    @community = Community.includes(:posts, :account, :subscriptions).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def community_params
    params.permit(:name, :url, :rules, :summary, :total_members, :account_id, :profile_image, :cover_image, :category)
  end

  def check_if_banned
    banned_user = BannedUser.find_by(account_id: params[:account_id], community_id: params[:id])
    return if banned_user.nil?

    render json: { message: 'User Already Banned' }
  end
end
