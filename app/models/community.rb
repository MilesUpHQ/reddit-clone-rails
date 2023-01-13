class Community < ApplicationRecord
  extend FriendlyId
  include ImageValidation
  friendly_id :slug_candidates, use: %i[slugged history finders]

  has_many :accounts, through: :banned_users
  has_many :posts, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :account
  has_one_attached :profile_image
  has_one_attached :cover_image
  has_many :banned_users
  belongs_to :account

  validates_presence_of :summary, :name, :rules, :category
  validates :name, uniqueness: true
  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }
  validate :accept_proflie_image
  validate :accept_cover_image

  CATEGORIES = Category.pluck(:name)

  def validate_name
    return unless Community.where(name: name).exists?

    errors.add(:name, 'has already been taken please choose some other Community name')
  end

  def should_generate_new_friendly_id?
    name_changed? || slug.blank?
  end

  def slug_candidates
    [
      :name,
      %i[name category],
      %i[name category url]
    ]
  end

  def accept_proflie_image
    validate_image(profile_image, :profile_image)
  end

  def accept_cover_image
    validate_image(cover_image, :cover_image)
  end
end
