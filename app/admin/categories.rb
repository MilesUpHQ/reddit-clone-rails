ActiveAdmin.register Category do
  permit_params :name

  index do
    column :id
    column :name
    column :created_at
    column :updated_at
    actions
    column do |category|
      link_to 'Community-Page', new_admin_community_path(category: category), method: :get
    end
  end
end
