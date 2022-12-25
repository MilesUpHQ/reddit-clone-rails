class BannedusersController < ApplicationController
  def create 
    @banneduser = Banneduser.new(banneduser_params)
    # @username= Account.find_by(username: params[:username])
    # @banneduser.account_id = @username.Account_id
    @banneduser.save
  end

  def banneduser_params
    params.require(:banneduser).permit(:username, :reason, :explanation) 
  end

end
