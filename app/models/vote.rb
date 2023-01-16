class Vote < ApplicationRecord
  validates_uniqueness_of :account_id, scope: :post_id
  belongs_to :account
  belongs_to :post

  after_create :increment_vote, :add_karma
  after_destroy :decrement_vote, :remove_karma

  scope :vote, ->(value) { where('upvote=', value) }

  private

  def increment_vote
    field = upvote ? :upvotes : :downvotes
    post.increment!(field)
  end

  def decrement_vote
    field = upvote ? :upvotes : :downvotes
    post.decrement!(field)
  end

  def add_karma
    account.increment!(:karma)
  end

  def remove_karma
    account.decrement!(:karma)
  end

  def self.save_vote(new_vote, existing_vote)
    if existing_vote.size > 0
      if existing_vote.first.upvote == new_vote.upvote
        existing_vote.first.destroy
      else
        existing_vote.first.destroy
        new_vote.save
      end
    else
      new_vote.save
    end 
  end
end
