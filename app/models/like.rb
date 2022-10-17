class Like < ApplicationRecord
  belongs_to :discussion
  belongs_to :user
  validates_uniqueness_of :discussion_id, scope: :user_id
  after_create :increase_discussion_like_counter
  after_destroy :decrease_discussion_like_counter
  private
  def increase_discussion_like_counter
      Discussion.find(self.discussion_id).increment(:total_likes_count).save
  end
  def decrease_discussion_like_counter
      Discussion.find(self.discussion_id).decrement(:total_likes_count).save
  end  
end
