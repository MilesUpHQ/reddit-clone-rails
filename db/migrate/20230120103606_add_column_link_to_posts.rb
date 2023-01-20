class AddColumnLinkToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :link, :string 
  end
end
