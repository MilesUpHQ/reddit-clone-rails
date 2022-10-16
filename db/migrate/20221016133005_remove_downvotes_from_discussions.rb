class RemoveDownvotesFromDiscussions < ActiveRecord::Migration[6.1]
  def change
    remove_column :discussions, :downvotes, :integer
  end
end
