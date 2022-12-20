class SubscriptionsController < ApplicationController
  before_action :community_list
  before_action :authenticate_account!
  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.account_id = current_account.id
    @subscription.save
    redirect_to community_path(@subscription.community_id)
  end

  def subscription_params
    params.require(:subscription).permit(:community_id)
  end

  def index
    @subscriptions = Subscription.where(account_id: current_account.id) 
  end


  private
  def community_list 
    @communities = Community.order(created_at: :asc)  
  end
end
