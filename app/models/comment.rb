class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :account
  belongs_to :parent, class_name: "Comment", optional: true
  has_many :replies, class_name: "Comment", foreign_key: "parent_id", dependent: :destroy
  validates_presence_of :message, :account_id, :post_id
  has_rich_text :message  
end
