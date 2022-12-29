ActiveAdmin.register Report do
  permit_params :post_id, :report_reason_id, :account_id, :report_category_id

  index do 
    column :id
    column :post
    column :category do 
      report_category = ReportCategory.find_by(params[:report_category_id])
      report_category.name
    end
    column :reason do
      report_reason = ReportReason.find_by(params[:report_reason_id])
      report_reason.reason
    end 
    column :account
    actions 
  end 
end