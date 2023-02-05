class CreateReportReasons < ActiveRecord::Migration[6.1]
  def change
    create_table :report_reasons do |t|
      t.string :reason
      t.references :report_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
