class BannedUsersController < ApplicationController
    def create 
        @banneduser = BannedUser.new(banneduser_params)
        @username = Account.find_by!(username: @banneduser[:username])
        @banneduser.account_id = @username.id  
        @banneduser.save 
        redirect_to mod_path(Community.find_by(params[:community_id]))
    end
    
    def banneduser_params
     params.require(:banned_user).permit(:username, :reason, :explanation, :account_id, :community_id)    
    end
    
end
