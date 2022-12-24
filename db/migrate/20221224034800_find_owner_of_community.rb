class FindOwnerOfCommunity < ActiveRecord::Migration[6.1]
  def change
    add_column :communities, :is_owner, :boolean, :default => false 
  end
end
