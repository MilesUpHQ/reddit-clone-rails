class Addviewcounttopost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :view_count, :integer, default: 0
  end
  
end
