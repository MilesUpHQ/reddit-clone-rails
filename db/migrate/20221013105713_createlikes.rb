class Createlikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :user
      t.references :discussion

      t.timestamps
    end 
  end
end
