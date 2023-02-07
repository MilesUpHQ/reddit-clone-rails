class BannedUser < ApplicationRecord
  validates_presence_of :reason, :explanation
  belongs_to :account
  belongs_to :community

  def days_since_creation
    (Time.now - created_at) / 86400
  end
end
