class AddFieldsToBanuser < ActiveRecord::Migration[6.1]
  def change
    add_column :banned_users, :duration, :integer, default: 0
    add_column :banned_users, :permanent, :boolean
  end
end
