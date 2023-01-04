class Community < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates ,use: %i[slugged history finders]

  has_many :accounts, through: :banned_users
  validates_presence_of :summary, :name, :rules, :category
  validates :name ,uniqueness: true
  validates :url, format: { with: /\A[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix }
  has_many :posts, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :account
  has_one_attached :profile_image
  has_one_attached :cover_image
  has_many :banned_users


  def validate_name
    if Community.where(name: name).exists?
      errors.add(:name, "has already been taken please choose some other Community name")
    end
  end

  if Category.table_exists? 
    CATEGORIES = Category.pluck(:name)
  end
    def should_generate_new_friendly_id?
      name_changed? || slug.blank?
    end

    def slug_candidates
      [
        :name,
        [:name, :category],
        [:name, :category,:url]
      ]
    end
end
