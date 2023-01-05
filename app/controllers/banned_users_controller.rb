class BannedUsersController < ApplicationController
    def create 
        @banned_user = BannedUser.new(banned_user_params)
        @username = Account.find_by!(username: @banned_user[:username])
        @banned_user.account_id = @username.id  
        if BannedUser.find_by(account_id: @banned_user.account_id, community_id: @banned_user.community_id).nil? 
            @banned_user.save
            redirect_to mod_path(Community.find_by(params[:community_id]))
        else
            redirect_to mod_path(Community.find_by(params[:community_id])), alert: "You have Already Banned this User."
        end       
    end
    
    def banned_user_params
     params.require(:banned_user).permit(:username, :reason, :explanation, :account_id, :community_id)    
    end
    
end
