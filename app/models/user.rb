class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :discussions, dependent: :destroy
  has_many :channels, through: :discussions
  has_many :votes

  def upvoted_discussion_ids
    #creates an array of discussion_ids we upvoted
    self.votes.where(upvote: true).pluck(:discussion_id)
  end

  def downvoted_discussion_ids
    self.votes.where(upvote: false).pluck(:discussion_id)
  end  
end
