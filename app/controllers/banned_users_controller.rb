class BannedUsersController < ApplicationController
    def create 
        @banneduser = BannedUser.new(banneduser_params)
        @username= Account.where(username: params[:username])
        # @banneduser.community_id = params[:community_id]
        # @banneduser.account_id = @username.id            
        @banneduser.save 
    end
    
      def banneduser_params
        params.require(:banned_user).permit(:username, :reason, :explanation, :community_id)    
    end
    
end
