class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :discussion

  validates_uniqueness_of :user_id, scope: :discussion_id

  after_create :increment_vote
  after_destroy :decrement_vote

  def increment_vote
    field = self.upvote ? :upvotes : :downvotes
    Discussion.find(self.discussion_id).increment(field).save
  end

  def decrement_vote
    field = self.upvote ? :upvotes : :downvotes
    Discussion.find(self.discussion_id).decrement(field).save
  end
end
  
