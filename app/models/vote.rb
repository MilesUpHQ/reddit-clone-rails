class Vote < ApplicationRecord
  belongs_to :account
  belongs_to :post

  validates_uniqueness_of :account_id, scope: :post_id

  after_create :increment_vote, :add_karma
  after_destroy :decrement_vote, :remove_karma

  private

  def increment_vote
    field = self.upvote ? :upvotes : :downvotes
    Post.find(self.post_id).increment(field).save
  end

  def decrement_vote
    field = self.upvote ? :upvotes : :downvotes
    Post.find(self.post_id).decrement(field).save
  end

  def add_karma
    account = Account.find(self.account_id)
    account.increment(:karma, 1).save
  end

  def remove_karma
    account = Account.find(self.account_id)
    account.decrement(:karma, 1).save
  end

end
