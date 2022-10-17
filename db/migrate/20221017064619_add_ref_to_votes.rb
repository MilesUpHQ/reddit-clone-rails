class AddRefToVotes < ActiveRecord::Migration[6.1]
  def change
    add_reference(:votes, :discussion, index: :true)
  end
end
