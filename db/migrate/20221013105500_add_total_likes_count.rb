class AddTotalLikesCount < ActiveRecord::Migration[6.1]
  def change
    add_column :discussions, :total_likes_count, :integer 
  end
end
