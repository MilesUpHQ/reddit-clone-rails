class Post < ApplicationRecord
  belongs_to :account
  belongs_to :community
  validates_presence_of :title, :body, :account_id, :community_id
  has_many :comments

  has_rich_text :body 
  has_rich_text :polls
  has_many :options

  def score
    # difference between upvotes and downvotes
    if self.upvotes > 0 || self.downvotes > 0
      self.upvotes > 0 ? (self.upvotes - self.downvotes) : (self.downvotes * -1)
    else
      0
    end
  end

end    
