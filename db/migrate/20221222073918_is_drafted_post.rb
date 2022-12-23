class IsDraftedPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :is_drafted, :boolean
  end
end
