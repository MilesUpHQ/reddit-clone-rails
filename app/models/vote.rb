class Vote < ApplicationRecord
    validates_uniqueness_of :account_id, scope: :post_id
    belongs_to :account
    belongs_to :post
end
