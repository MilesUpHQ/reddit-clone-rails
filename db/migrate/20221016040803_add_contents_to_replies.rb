class AddContentsToReplies < ActiveRecord::Migration[6.1]
  def change
    add_column :replies, :contents, :text
  end
end
