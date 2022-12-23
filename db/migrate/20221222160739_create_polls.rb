class CreatePolls < ActiveRecord::Migration[6.1]
  def change
    create_table :polls do |t|
      t.string :poll_option

      t.timestamps
    end
  end
end
