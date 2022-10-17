class Addreferencetovotes < ActiveRecord::Migration[6.1]
  def change
    add_reference(:votes, :discussions, index: true)
  end
end
