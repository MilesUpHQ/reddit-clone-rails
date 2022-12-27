class SetDefaultToSensitiveContents < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :oc, :boolean, :default => false
    change_column :posts, :spoiler, :boolean, :default => false
    change_column :posts, :nsfw, :boolean, :default => false
  end
end
