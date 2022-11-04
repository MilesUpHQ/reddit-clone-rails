class PostCountThisWeek < ActiveRecord::Migration[6.1]
  def change
    add_column :communities, :post_count_this_week, :bigint
  end
end
