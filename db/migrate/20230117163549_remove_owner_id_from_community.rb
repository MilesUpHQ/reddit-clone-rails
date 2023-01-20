class RemoveOwnerIdFromCommunity < ActiveRecord::Migration[6.1]
  def change
    remove_column :communities, :owner_id, :integer
  end
end
