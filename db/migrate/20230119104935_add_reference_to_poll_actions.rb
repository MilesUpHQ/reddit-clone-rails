class AddReferenceToPollActions < ActiveRecord::Migration[6.1]
  def change
    add_reference :poll_answers, :community, foreign_key: true
  end
end
