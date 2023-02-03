class AddcolumnReport < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :report_categories_name, :string
    add_column :reports, :report_reason_name, :string
  end
end
