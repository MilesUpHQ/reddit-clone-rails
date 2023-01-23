class AddColumnToPollColumnsToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :poll_topic, :text
    add_column :posts, :option1, :string
    add_column :posts, :option2, :string
    add_column :posts, :option3, :string
    add_column :posts, :option4, :string
  end
end
