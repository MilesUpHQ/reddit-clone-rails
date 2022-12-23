class AddCompanyToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :poll, :string
  end
end
