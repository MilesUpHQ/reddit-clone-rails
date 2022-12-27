class AddColumnToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :oc, :boolean
    add_column :posts, :spoiler, :boolean
    add_column :posts, :nsfw, :boolean
  end
end
