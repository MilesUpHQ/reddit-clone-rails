class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: %i[slugged history finders]
  include ImageValidation

  validates :title, presence: { message: " can't be blank" }
  validate :acceptable_image
  validates_presence_of :account_id, :community_id
  validate :post_body_validation

  belongs_to :account
  belongs_to :community
 
  has_many :comments, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :save_posts
  has_rich_text :body
  has_many_attached :images, dependent: :destroy
  has_many :poll_answer

  scope :drafts, ->(account_id) { where(account_id: account_id, is_drafted: true) }

  def score
    if upvotes.positive? || downvotes.positive?
      upvotes.positive? ? (upvotes - downvotes) : (downvotes * -1)
    else
      0
    end
  end

  def should_generate_new_friendly_id?
    title_changed? || slug.blank?
  end

  def acceptable_image
    validate_multiple_images(images, :images)
  end

  def post_body_validation
    unless body.present? || images.present? || link.present? || poll_topic.present?
      errors.add(:base, "At least one of body or images or link or poll_topic must be present")
    end
  end
end
