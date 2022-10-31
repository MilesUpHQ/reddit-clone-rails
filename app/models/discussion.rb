class Discussion < ApplicationRecord

  belongs_to :channel 
  belongs_to :user
  has_many :replies, dependent: :destroy
  has_many :votes

  acts_as_paranoid  #Deleted posts will be saved for future use
  validates :title, :contents, presence: true
  resourcify
  

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    title_changed?
  end

  has_rich_text :contents   
  validates :contents, :length => { :maximum => 1000,
    :too_long => "%{count} characters is the maximum allowed" }
  def score
    #difference between upvotes and downvotes
    if self.upvotes > 0  || self.downvotes > 0
      self.upvotes > 0 ? (self.upvotes - self.downvotes) : (self.downvotes * -1)
    else
       0
    end
  end

end
