class PollAnswer < ApplicationRecord
    belongs_to :account
    belongs_to :post
    belongs_to :community
end
