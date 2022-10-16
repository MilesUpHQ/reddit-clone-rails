class AddUpvotesToDiscussions < ActiveRecord::Migration[6.1]
  def change
    add_column :discussions, :upvotes, :integer, default: 0
  end
end
