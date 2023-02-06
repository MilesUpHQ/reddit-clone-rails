class AddVotesToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :votes, :integer
  end
end
