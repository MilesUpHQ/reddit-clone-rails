class CreateBannedusers < ActiveRecord::Migration[6.1]
  def change
    create_table :bannedusers do |t|
      t.string :username
      t.string :reason
      t.string :explanation
      t.references :Account 
      t.references :Subscription 
      t.references :Community
      t.timestamps
    end
  end
end
