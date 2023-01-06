class BannedUsersController < ApplicationController
  def create  
    @banned_user = BannedUser.new(banned_user_params)
    @community = Community.find_by!(params[:community_id])
    @username = Account.find_by(username: @banned_user[:username])
    if @username.nil?  
        flash[:alert] = t(:user_not_present, username: @username.username)
    else  
        @subscriptions = Subscription.where(account_id: @username.id,community_id: params[:banned_user][:community_id])
        if @subscriptions.any?
            @banned_user.account_id = @username.id  
            if @banned_user.account_id == current_account.id
                flash[:notice] = t(:admin_ban, username: @username.username)
            else
                if BannedUser.find_by(account_id: @banned_user.account_id, community_id: @banned_user.community_id).nil? 
                    flash[:notice] = t(:banned_successfully, username: @username.username)
                    @banned_user.save
                elsif BannedUser.find_by(account_id: @banned_user.account_id, community_id: @banned_user.community_id).present?
                    flash[:alert] = t(:already_banned, username: @username.username)
                end   
            end 
        else    
            flash[:alert] = t(:not_present_to_ban, username: @username.username)
        end 
    end
    redirect_to mod_path(@community) and return
end
  
  def banned_user_params
   params.require(:banned_user).permit(:username, :reason, :explanation, :account_id, :community_id)  
  end
  
end
