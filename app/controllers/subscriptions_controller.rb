class SubscriptionsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_community, only: :destroy

  def create
    session[:mark_as_read] = 0
    @subscription = Subscription.new subscription_params
    @subscription.account_id = current_account.id
    @subscription.save
    redirect_back(fallback_location: root_path, notice: t("community.joined"))
  end

  def subscription_params
    params.require(:subscription).permit(:community_id)
  end

  def destroy
    @subscriptions = Subscription.where(account_id: current_account.id, community_id: @community.id)
    @subscriptions.first.destroy
    redirect_back(fallback_location: root_path, notice: t("community.left"))
  end

  private
  def find_subscription
    @subscription = Subscription.find(params[:id])
  end
end
