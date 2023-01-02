class ChangeSavePosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :save_posts, :posts_id, :post_id
  end
end
