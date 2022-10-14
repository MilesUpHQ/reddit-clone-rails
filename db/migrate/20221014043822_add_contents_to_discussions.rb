class AddContentsToDiscussions < ActiveRecord::Migration[6.1]
  def change
    add_column :discussions, :contents, :text
  end
end
