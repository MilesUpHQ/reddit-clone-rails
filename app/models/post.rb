class Post < ApplicationRecord
  belongs_to :account
  belongs_to :community

  has_many :comments, dependent: :destroy
  has_many :save_posts, dependent: :destroy
  validates_presence_of :title, :body
end
