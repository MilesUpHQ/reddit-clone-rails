class CreateCommunities < ActiveRecord::Migration[6.1]
  def change
    create_table :communities do |t|
      t.references :account, null: false, foreign_key: true
      t.string :name
      t.string :url
      t.string :rules
      t.integer :total_members

      t.timestamps
    end
  end
end
