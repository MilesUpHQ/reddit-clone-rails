module BannedUsersHelper
  def account_username(user)
    Account.find(user.username).username
  end
end
