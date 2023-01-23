module BannedusersHelper
  
  def new_banned_user
    @banneduser = BannedUser.new
  end

  def account_by_username(user)
    Account.find(user.username).username
  end 
end
