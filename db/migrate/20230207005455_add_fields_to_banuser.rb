class AddFieldsToBanuser < ActiveRecord::Migration[6.1]
  def change
    add_column :banned_users, :duration, :integer
    add_column :banned_users, :permanent, :boolean
  end
end
