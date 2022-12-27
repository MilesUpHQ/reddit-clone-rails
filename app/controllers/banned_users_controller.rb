class BannedUsersController < ApplicationController
    def create 
        @banneduser = BannedUser.new(banneduser_params)
        @username = Account.find_by!(username: @banneduser[:username])
        @banneduser.community_id = Community.find_by!(params[:community_id]).id
        @banneduser.account_id = @username.id  
        # @banner_user.account_id = @username.id  
        @banneduser.save 
    end
    
      def banneduser_params
        params.require(:banned_user).permit(:username, :reason, :explanation, :account_id, :community_id)    
    end
    
end
