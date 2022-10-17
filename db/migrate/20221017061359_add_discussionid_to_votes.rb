class AddDiscussionidToVotes < ActiveRecord::Migration[6.1]
  def change
    add_column :votes, :discussion_id, :integer
  end
end
