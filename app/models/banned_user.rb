class BannedUser < ApplicationRecord
  validates_presence_of :reason, :explanation
  belongs_to :account
  belongs_to :community
  after_create :schedule_removal

  def days_since_creation
    (Time.now - created_at) / 86400
  end

  private

  def schedule_removal
    UnBanJob.set(wait: duration.days).perform_later(id)
  end
end
