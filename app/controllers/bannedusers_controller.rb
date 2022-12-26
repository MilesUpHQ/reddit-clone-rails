class BannedusersController < ApplicationController
  def create 
    @banneduser = Banneduser.new(banneduser_params)
    @username= Account.where(username: params[:username])
    # @banneduser.community_id = params[:community_id]
    # @banneduser.account_id = @username.id            
    @banneduser.save 
  end

  def banneduser_params
    params.require(:banneduser).permit(:username, :reason, :explanation, :Community_id)    
  end

end    
