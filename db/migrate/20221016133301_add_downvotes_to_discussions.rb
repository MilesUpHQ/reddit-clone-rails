class AddDownvotesToDiscussions < ActiveRecord::Migration[6.1]
  def change
    add_column :discussions, :downvotes, :integer, default: 0
  end
end
