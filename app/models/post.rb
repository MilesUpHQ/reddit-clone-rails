class Post < ApplicationRecord
  belongs_to :account
  belongs_to :community
  has_many :votes, dependent: :destroy

  has_many :comments, dependent: :destroy
  validates_presence_of :title, :body
end
