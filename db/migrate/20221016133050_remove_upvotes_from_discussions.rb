class RemoveUpvotesFromDiscussions < ActiveRecord::Migration[6.1]
  def change
    remove_column :discussions, :upvotes, :integer
  end
end
