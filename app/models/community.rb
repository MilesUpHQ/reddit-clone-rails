class Community < ApplicationRecord
  has_many :accounts, through: :banned_users
  validates_presence_of :url, :name, :rules, :category
  has_many :posts, dependent: :destroy
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :account
  has_one_attached :profile_image
  has_one_attached :cover_image
  has_many :banned_users
 if Category.table_exists?
  CATEGORIES = Category.pluck(:name)
 end
end 
