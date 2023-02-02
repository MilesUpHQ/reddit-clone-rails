class AddPostTitleToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :post_title, :string
  end
end
