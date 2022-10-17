class RemoveDiscussionIdFromVotes < ActiveRecord::Migration[6.1]
  def change
    remove_column :votes, :discussion_id, :integer
  end
end
