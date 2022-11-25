class AddCategoryInCommunities < ActiveRecord::Migration[6.1]
  def change
    add_column :communities, :category, :string
  end
end
