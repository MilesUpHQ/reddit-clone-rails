class AddOwnerIdToCommunities < ActiveRecord::Migration[6.1]
  def change
    add_column :communities ,:owner_id, :integer
    remove_column :communities, :is_owner, :boolean, :default => false 
  end
end
