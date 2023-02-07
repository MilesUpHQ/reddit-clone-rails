class UnBanJob < ApplicationJob
    queue_as :default
  
    def perform(ban_user_id)
      ban_user = BanUser.find(ban_user_id)
      if ban_user.days_since_creation >= ban_user.ban_duration
        ban_user.destroy
      end
    end
end
  