class AddColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :option1, :string
    add_column :posts, :option2, :string
    add_column :posts, :option3, :string
  end
end
