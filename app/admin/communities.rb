ActiveAdmin.register Community do
  permit_params :account_id, :name, :url, :summary, :rules, :total_members, :category

  index do
    column "Owner" do |community|
      community.account.username
    end
    column :name
    column :url
    column :summary
    column :rules
    column :total_members
    column :post_count_this_week
    column :category
    column :created_at
    column :updated_at
    actions
  end 
  form do |f|
    f.inputs "Create Community" do
      f.input :name
      f.input :url
      f.input :summary
      f.input :rules
      f.input :post_count_this_week
      f.input :category,  :label => 'category', :collection => Community::CATEGORIES, :prompt => "Select Category"
      f.input :created_at
      f.input :updated_at
      f.submit "Submit", disable_with: 'Submiting...'
    end
  end
end
