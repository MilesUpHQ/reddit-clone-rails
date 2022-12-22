class SubscriptionsController < ApplicationController
  before_action :community_list
  before_action :authenticate_account!

  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.account_id = current_account.id
    @subscription.save
    redirect_back(fallback_location: root_path)
    # redirect_to community_path(@subscription.community_id)
  end

  def subscription_params
    params.require(:subscription).permit(:community_id)
  end

  def index
    @subscriptions = Subscription.where(account_id: current_account.id)
  end

  def destroy
    @subscriptions = Subscription.where(account_id: current_account.id).where(community_id: params[:id])
    @subscriptions.each do |subscription|
      subscription.destroy
    end
    redirect_back(fallback_location: root_path)
  end

  private
  def community_list
    @communities = Community.order(created_at: :asc)
  end

  def find_subscription
    @subscription = Subscription.find(params[:id])
  end
end
