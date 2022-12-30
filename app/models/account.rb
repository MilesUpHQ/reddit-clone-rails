class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable

  has_many :subscriptions
  has_many :communities, through: :subscriptions
  has_many :posts
  has_many :comments
  has_many :votes
  has_many :saved_posts
  has_one_attached :profile_image

  validates_presence_of :first_name, :last_name, :username

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
