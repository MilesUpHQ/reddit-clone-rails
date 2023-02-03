class CreateBannedUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :banned_users do |t|
      t.string :username
      t.string :reason
      t.string :explanation
      t.references :account
      t.references :subscription
      t.references :community

      t.timestamps
    end
  end
end
