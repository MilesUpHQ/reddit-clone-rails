ActiveAdmin.register ReportReason do
  permit_params :report_category_id, :reason
  index do 
    column :report_category_id
    column :report_category
    column :reason 
    column :created_at
    column :updated_at
    actions 
  end

  form do |f|
    f.inputs "Report Reasons" do
      f.input :report_category,  :label => 'report_category', :as => :select,
                 :collection => ReportCategory.all.collect {|option| [option.name, option.id]},
                 :selected => params[:report_category]
      f.input :reason
      f.input :created_at
      f.input :updated_at
      f.submit "Submit", disable_with: 'Submiting...'
    end
  end
end
  