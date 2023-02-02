class Api::V1::SubscriptionsController < ApplicationController
  def index
    @subscription = Subscription.all

    render json: @subscription
  end

  def create
    @subscription = Subscription.new(subscription_params)
    if @subscription.save
      render json: @subscription, status: :created
    else
      render json: { error: @subscription.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @subscriptions = Subscription.find(params[:id])
    if @subscriptions.destroy
      render json: @subscription, status: :ok
    else
      render json: { error: @subscriptions.first.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:community_id, :account_id)
  end
end
