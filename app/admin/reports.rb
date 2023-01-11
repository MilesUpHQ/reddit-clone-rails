ActiveAdmin.register Report do
  permit_params :post_id, :report_reason_id, :account_id, :report_category_id

  index do 
    column :id
    column :post
    column "Report Category" do |report|
      report.report_category.name
    end
    column "Report Reason" do |report|
      report.report_reason.reason 
    end
    column :account
    actions 
  end 
end