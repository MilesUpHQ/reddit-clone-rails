ActiveAdmin.register Post do
  permit_params :account_id,:community_id,:title, :body
end
