class BannedUser < ApplicationRecord
    has_one :account 
    belongs_to :community
end 