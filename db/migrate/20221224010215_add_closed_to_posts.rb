class AddClosedToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :closed , :boolean, :default => false
  end
end
