class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :account

  validates_presence_of :message, :account_id, :post_id
  has_rich_text :message  
end
