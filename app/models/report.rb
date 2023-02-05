class Report < ApplicationRecord
  belongs_to :post
  belongs_to :account
  validates :post_id, uniqueness: { scope: :account_id }
end
