class SubscriptionsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_community, only: :destroy

  def create
    @subscription = Subscription.new subscription_params
    @subscription.account_id = current_account.id
    Account.where(id: @subscription.community.account_id).update(notification_status: true)
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
