class UnBanJob < ApplicationJob
    queue_as :default
  
    def perform_later(ban_user_id)
      ban_user = BanUser.find(ban_user_id)
      if  ban_user.duration > 0 && ban_user.days_since_creation >= ban_user.duration
        ban_user.destroy
      end
    end
end
  