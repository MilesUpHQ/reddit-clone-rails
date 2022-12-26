class Community < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates ,use: %i[slugged history] 
  
  belongs_to :account
  validates_presence_of :url, :name, :rules, :category
  has_many :posts, dependent: :destroy
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :account
  has_one_attached :profile_image
  has_one_attached :cover_image
  
    CATEGORIES = Category.pluck(:name)
  
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
