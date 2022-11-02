class AddSummaryToCommunities < ActiveRecord::Migration[6.0]
  def change
    add_column :communities, :summary, :string
  end
end
