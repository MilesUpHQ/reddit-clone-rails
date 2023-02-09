class AddColumnToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :notification_status, :boolean , :default => false
  end
end
