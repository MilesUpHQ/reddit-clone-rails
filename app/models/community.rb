class Community < ApplicationRecord
  belongs_to :account
  has_many :posts, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  mount_uploader :profile_image, ProfilePictureUploader
  mount_uploader :cover_image, CoverImageUploader

  validates_presence_of :name, :rules
  validates :name, uniqueness: true
  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }
end
