class AddContentwarningToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :oc, :boolean , :default => false
    add_column :posts, :spoiler, :boolean, :default => false
    add_column :posts, :nsfw, :boolean, :default => false
  end
end
