class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.references :post, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
