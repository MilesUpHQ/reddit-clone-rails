class Api::V1::BannedUsersController < ApplicationController
  before_action :set_banned_users, only: %i[create]

  def index
    @banned_user = BannedUser.all
    render json: @banned_user
  end

  def create
    if @banned_user.save
      render json: @banned_user, status: :created
    else
      render json: @banned_user.errors, status: :unprocessable_entity
    end
  end

  private

  def set_banned_users
    @community = Community.includes(:banned_users).find(params[:community_id])
    @banned_user = @community.banned_users.new(banned_user_params)
  end

  def banned_user_params
    params.require(:banned_user).permit(:username, :reason, :explanation, :account_id)
  end
end
