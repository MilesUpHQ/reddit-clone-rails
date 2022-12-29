ActiveAdmin.register ReportCategory do
  permit_params :name
  index do
    column :name
    column :Redirect do |report|
      link_to 'Reason-Page', new_admin_report_reason_path(report_category: report), method: :get 
    end
    actions
  end
end