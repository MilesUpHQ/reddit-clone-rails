class RemoveDiscussionsidFromVotes < ActiveRecord::Migration[6.1]
  def change
    remove_column :votes, :discussions_id, :integer
  end
end
