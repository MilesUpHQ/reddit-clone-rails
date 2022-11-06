ActiveAdmin.register Community do
  permit_params :name, :url, :summary, :rules, :total_members
end
