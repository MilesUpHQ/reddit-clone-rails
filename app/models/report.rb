class Report < ApplicationRecord
  belongs_to :post
  belongs_to :report_reason
  belongs_to :report_category
  belongs_to :account
end
