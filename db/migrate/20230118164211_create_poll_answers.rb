class CreatePollAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :poll_answers do |t|
      t.string :poll_answer
      t.string :post
      t.references :post
      t.references :account
  
      t.timestamps
    end
  end
end
