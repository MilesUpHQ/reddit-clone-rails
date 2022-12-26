class SetDefaultToSavedPost < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :saved , :boolean, :default => false
  end
end
