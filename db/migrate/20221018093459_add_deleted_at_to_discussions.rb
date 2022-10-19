class AddDeletedAtToDiscussions < ActiveRecord::Migration[6.1]
  def change
    add_column :discussions, :deleted_at, :datetime
    add_index :discussions, :deleted_at
  end
end   
