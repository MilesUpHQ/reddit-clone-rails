class BannedUsersController < ApplicationController
  before_action :set_banned_users, :set_community, only: [:create]
  before_action :set_username, only: [:create]
  before_action :is_admin?, only: [:create]
  def create
    unless @subscriptions.any?
      redirect_to mod_path(@community) and return flash[:alert] =
t('ban.user_not_present_in_community', username: @username.username)
    end

    @banned_user.account_id = @username.id
    if BannedUser.find_by(account_id: @banned_user.account_id, community_id: @banned_user.community_id).nil?
      flash[:notice] = t('ban.success', username: @username.username)
      @banned_user.save
    else
      flash[:alert] = t('ban.already_done', username: @username.username)
    end
    redirect_to mod_path(@community) and return
  end

  def banned_user_params
    params.require(:banned_user).permit(:username, :reason, :explanation, :account_id, :community_id)
  end

  private

  def set_banned_users
    @banned_user = BannedUser.new(banned_user_params)
  end

  def set_community
    @community = Community.find_by(params[:community_id])
  end

  def set_username
    @username = Account.find(@banned_user[:username])
    if @username.nil?
      redirect_to mod_path(@community) and return flash[:alert] =
t('ban.user_not_available', username: @banned_user[:username])
    end

    @subscriptions = Subscription.where(account_id: @username.id, community_id: params[:banned_user][:community_id])
  end

  def is_admin?
    return unless @username == current_account

    redirect_to mod_path(@community) and return flash[:alert] =
t('ban.moderator_not_possible', username: @username.username)
  end
end
