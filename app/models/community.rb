class Community < ApplicationRecord
  belongs_to :account

  validates_presence_of :name, :rules
  validates :name, uniqueness: true
  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }
end
