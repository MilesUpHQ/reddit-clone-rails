class BannedUsersController < ApplicationController
    def create        
        @banned_user = BannedUser.new(banned_user_params)
        @community = Community.find_by(params[:community_id])
        @username = Account.find_by(username: @banned_user[:username])
        unless @username.nil?  
            @sub = Subscription.where(account_id: @username.id, community_id: @community.id)
            unless @sub.any? 
                flash[:warning] = "No such user in your Community."
            else
                @banned_user.account_id = @username.id  
                if @banned_user.account_id == current_account.id
                    flash[:warning] = "Moderator cannot be Banned!"
                else
                    if BannedUser.find_by(account_id: @banned_user.account_id, community_id: @banned_user.community_id).nil? 
                        flash[:notice] = "Banned User Successfully"
                        @banned_user.save
                    elsif BannedUser.find_by(account_id: @banned_user.account_id, community_id: @banned_user.community_id).present?
                        flash[:warning] = "You have Already Banned this User."
                    end     
                end  
            end
        else
            flash[:warning] = "No such user in your Community."
        end
        redirect_to mod_path(@community)
    end
    
    def banned_user_params
     params.require(:banned_user).permit(:username, :reason, :explanation, :account_id, :community_id)    
    end
    
end
