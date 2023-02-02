class AddProfileImageToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :profile_image, :string
  end
end
