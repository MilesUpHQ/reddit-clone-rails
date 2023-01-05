class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title ,use: %i[slugged history finders]
  include Image

  belongs_to :account
  belongs_to :community
  validates_presence_of :account_id, :community_id
  validates :title, presence: { message: "Title can't be blank" }
  validates :body, presence: { message: "Body can't be blank" }
  has_many :comments, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :save_posts
  has_rich_text :body
  has_many_attached :images, dependent: :destroy
  validate :acceptable_image
  scope :drafts, ->(account_id) { where(account_id: account_id, is_drafted: true) }

  def score
    if self.upvotes > 0 || self.downvotes > 0
      self.upvotes > 0 ? (self.upvotes - self.downvotes) : (self.downvotes * -1)
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

end
