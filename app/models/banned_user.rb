class BannedUser < ApplicationRecord
  validates_presence_of :reason, :explanation
  belongs_to :account
  belongs_to :community
end
