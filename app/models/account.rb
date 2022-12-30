class Account < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable

  has_many :subscriptions
  has_many :communities ,through: :subscriptions
  has_many :posts
  has_many :comments
  has_many :votes
  has_one_attached :profile_image
  has_many :banned_users

  validates_presence_of :first_name, :last_name, :username
  validates :username, uniqueness: true
  def full_name
    "#{first_name} #{last_name}"
  end

  def upvoted_post_ids
    self.votes.where(upvote: true).pluck(:post_id)
  end

  def downvoted_post_ids
    self.votes.where(upvote: false).pluck(:post_id)
  end
  
end
