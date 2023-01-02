class SavePost < ApplicationRecord
    belongs_to :account
    belongs_to :post  
end
