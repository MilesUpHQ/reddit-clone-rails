class AddCommunityImage < ActiveRecord::Migration[6.1]
  def change
    add_column :communities, :cover_image, :string
    add_column :communities, :profile_image, :string
  end
end
