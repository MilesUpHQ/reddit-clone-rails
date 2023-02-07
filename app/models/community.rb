class Community < ApplicationRecord

  after_save :add_subscription

  belongs_to :account
  has_many :posts, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :banned_users, dependent: :destroy
  mount_uploader :profile_image, ProfilePictureUploader
  mount_uploader :cover_image, CoverImageUploader

  validates_presence_of :name, :rules
  validates :name, uniqueness: true
  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }
  
  def add_subscription
    Subscription.create!(community_id: id, account_id: account_id)
  end
end
