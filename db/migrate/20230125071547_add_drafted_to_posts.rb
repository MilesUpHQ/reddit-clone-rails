class AddDraftedToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :is_drafted, :boolean, :default => false 
  end
end
