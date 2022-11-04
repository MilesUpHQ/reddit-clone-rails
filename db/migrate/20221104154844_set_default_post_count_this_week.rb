class SetDefaultPostCountThisWeek < ActiveRecord::Migration[6.1]
  def change
    change_column :communities, :post_count_this_week, :bigint, :default => 0
  end
end
