class ApplicationController < ActionController::Base
  before_action :set_no_cache
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :subscribers_list, if: :account_signed_in?
  
  protected

  def set_no_cache
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
  end

  def community_list
    @communities = Community.order(created_at: :asc)
  end

  def set_community
    @community = Community.friendly.includes(:posts).find(params[:id])
  end

  def subscribers_list
    @subscribers = Subscription.where(account_id: current_account.id)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name username profile_image])
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name username])
  end

  def is_subscribed?
    account_signed_in? ? Subscription.where(community_id: @community.id, account_id: current_account.id).any? : false
  end
  
end
