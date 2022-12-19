ActiveAdmin.register Community do
  permit_params :account_id, :name, :url, :summary, :rules, :total_members
end
