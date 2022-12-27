class RemoveColumnToPost < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :oc, :boolean
    remove_column :posts, :spoiler, :boolean
    remove_column :posts, :nsfw, :boolean
    remove_column :posts, :oc_tag, :boolean
    remove_column :posts, :spoiler_tag, :boolean
    remove_column :posts, :nsfw_tag, :boolean
  end
end
