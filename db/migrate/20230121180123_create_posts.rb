class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :account, null: false, foreign_key: true
      t.references :community, null: false, foreign_key: true
      t.string :title
      t.text :body
      t.integer :upvotes, default: 0
      t.integer :downvotes, default: 0
      t.integer :total_comments, default: 0

      t.timestamps
    end
  end
end
