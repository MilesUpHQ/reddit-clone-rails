class SavePost < ApplicationRecord
    belongs_to :account
    belongs_to :community
    belongs_to :post  
end
