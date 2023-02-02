class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :communities, dependent: :destroy
  has_many :post, dependent: :destroy
  mount_uploader :profile_image, ProfilePictureUploader
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  validates_presence_of :first_name, :last_name, :username
  validates :username, uniqueness: true
  validates_format_of :first_name, :last_name, multiline: true, with: /^[a-z]+$/i
  validates_format_of :username, multiline: true, with: /^[a-z0-9]+$/i
end
