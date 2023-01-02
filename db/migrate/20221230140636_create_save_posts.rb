class CreateSavePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :save_posts do |t|
      t.references :account
      t.references :community
      t.references :posts
      t.timestamps
    end
  end
end
