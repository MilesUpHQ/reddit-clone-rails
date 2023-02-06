class AddVoteCountToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :vote_count, :integer, default: 0
  end
end
