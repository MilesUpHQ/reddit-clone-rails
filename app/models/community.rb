class Community < ApplicationRecord
  belongs_to :account
  validates_presence_of :url, :name, :rules, :category
  has_many :posts, dependent: :destroy
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :account
  has_one_attached :profile_image
  has_one_attached :cover_image

  CATEGORIES = ["Sports","Gaming","Technology","News","TV","Music","Crypto","Fasion","Food","Health","Science","Finance"]
end
