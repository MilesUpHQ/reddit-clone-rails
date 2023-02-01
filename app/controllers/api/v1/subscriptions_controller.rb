class Api::V1::SubscriptionsController < ApplicationController
  def index
    @subscription = Subscription.all

    render json: @subscription
  end

  def create
    @subscription = Subscription.new
    @subscription.community_id = params[:community_id]
    @subscription.account_id = params[:account_id]
    if @subscription.save
      render json: { message: 'Community Joined' }, status: :created
    else
      render json: { error: @subscription.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @subscriptions = Subscription.where(account_id: current_account.id, community_id: @community.id)
    if @subscriptions.first.destroy
      render json: { message: 'Community Leaved' }, status: :ok
    else
      render json: { error: @subscriptions.first.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:community_id)
  end
end
